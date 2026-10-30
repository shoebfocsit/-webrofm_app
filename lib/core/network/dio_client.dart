import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_storage/get_storage.dart';
import 'package:webrofm/core/constants/api_endpoints.dart';
import 'package:webrofm/core/constants/app_constants.dart';
import 'package:webrofm/routing/app_router.dart';

final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

final dioProvider = Provider<Dio>((ref) {
  final secureStorage = ref.watch(secureStorageProvider);
  final dio = Dio(BaseOptions(
    baseUrl: '${AppConstants.baseUrl}${AppConstants.apiSubUrl}',
    connectTimeout: AppConstants.apiConnectTimeout,
    receiveTimeout: AppConstants.apiReceiveTimeout,
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    },
  ));

  dio.interceptors.add(_AuthInterceptor(secureStorage));

  if (kDebugMode) {
    dio.interceptors.add(LogInterceptor(
      requestHeader: false,
      responseHeader: false,
      requestBody: true,
      responseBody: true,
      logPrint: (obj) {
        final str = obj.toString();
        // Guard: Never print or log tokens
        if (str.contains('refresh') ||
            str.contains('access') ||
            str.contains('Bearer') ||
            str.contains('Authorization')) {
          return;
        }
        debugPrint(str);
      },
    ));
  }

  return dio;
});

class _TokenRefreshResult {
  final String? accessToken;
  final String? refreshToken;
  final bool isSessionExpired;

  const _TokenRefreshResult({
    this.accessToken,
    this.refreshToken,
    this.isSessionExpired = false,
  });
}

class _AuthInterceptor extends Interceptor {
  final FlutterSecureStorage _secureStorage;
  Dio? _tokenRefreshDio;

  // Single-flight future to prevent concurrent refresh calls
  Future<_TokenRefreshResult>? _activeRefreshFuture;
  bool _isHandlingSessionExpiry = false;

  _AuthInterceptor(this._secureStorage);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!options.headers.containsKey('Authorization')) {
      String? token;
      try {
        token = await _secureStorage.read(key: AppConstants.prefToken);
      } catch (_) {
        // A storage read failure must never block requests
      }
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Only intercept 401 Unauthorized
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    final path = err.requestOptions.path;

    // If the request was the refresh endpoint itself and it returned 401:
    // Session is dead -> logout screen
    if (path.contains('/token/refresh')) {
      await _handleSessionExpired();
      return handler.next(err);
    }

    // Flow rule: retry 1 baar only. If already retried, do not loop
    if (err.requestOptions.extra['is_retry'] == true) {
      return handler.next(err);
    }

    // Check if token was already refreshed by another concurrent request
    final currentAccessToken = await _getCurrentAccessToken();
    final requestAuthHeader = err.requestOptions.headers['Authorization'] as String?;
    final requestToken = requestAuthHeader?.replaceFirst('Bearer ', '').trim();

    if (currentAccessToken != null &&
        currentAccessToken.isNotEmpty &&
        requestToken != null &&
        requestToken.isNotEmpty &&
        requestToken != currentAccessToken) {
      // Token was already refreshed while this request was in flight!
      // Retry immediately with the current token
      return _retryRequest(err, currentAccessToken, handler);
    }

    // Single-flight refresh call (all parallel 401s share this single call)
    final refreshResult = await _refreshTokenSingleFlight();

    // If refresh itself failed with 401 / invalid / blacklisted -> tabhi logout screen
    if (refreshResult.isSessionExpired) {
      await _handleSessionExpired();
      return handler.next(err);
    }

    if (refreshResult.accessToken != null && refreshResult.accessToken!.isNotEmpty) {
      // Both tokens saved successfully. Retry the request 1 time.
      return _retryRequest(
        err,
        refreshResult.accessToken!,
        handler,
        newRefreshToken: refreshResult.refreshToken,
      );
    }

    // Refresh failed for other reasons (e.g. connection timeout), do not force logout, forward error
    handler.next(err);
  }

  /// Ensures only 1 refresh request is executed in parallel across concurrent 401s.
  Future<_TokenRefreshResult> _refreshTokenSingleFlight() async {
    if (_activeRefreshFuture != null) {
      return await _activeRefreshFuture!;
    }

    final future = _performTokenRefresh();
    _activeRefreshFuture = future;

    try {
      final result = await future;
      return result;
    } finally {
      _activeRefreshFuture = null;
    }
  }

  /// Calls POST /api/token/refresh/ and saves BOTH rotated tokens to storage.
  Future<_TokenRefreshResult> _performTokenRefresh() async {
    try {
      final refreshToken =
          await _secureStorage.read(key: AppConstants.prefRefreshToken);
      if (refreshToken == null || refreshToken.trim().isEmpty) {
        return const _TokenRefreshResult(isSessionExpired: true);
      }

      _tokenRefreshDio ??= Dio(BaseOptions(
        connectTimeout: AppConstants.apiConnectTimeout,
        receiveTimeout: AppConstants.apiReceiveTimeout,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ));

      final urls = [
        ApiEndpoints.tokenRefresh,
        '${AppConstants.baseUrl}${AppConstants.apiSubUrl}/token/refresh',
      ];

      Response? response;
      for (final url in urls) {
        try {
          response = await _tokenRefreshDio!.post(
            url,
            data: {'refresh': refreshToken.trim()},
          );
          if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
            break;
          }
        } on DioException catch (e) {
          final code = e.response?.statusCode;
          // 401 or 400 means token expired, blacklisted, or invalid -> session expired!
          if (code == 401 || code == 400) {
            return const _TokenRefreshResult(isSessionExpired: true);
          }
          if (code == 404) {
            // URL not matched, try fallback
            continue;
          }
          return const _TokenRefreshResult();
        } catch (_) {}
      }

      if (response != null &&
          response.statusCode == 200 &&
          response.data is Map<String, dynamic>) {
        final data = response.data as Map<String, dynamic>;
        final newAccess = data['access'] as String? ?? data['token'] as String?;
        final newRefresh =
            data['refresh'] as String? ?? data['refresh_token'] as String?;

        if (newAccess != null && newAccess.isNotEmpty) {
          // COMPULSORY: Save BOTH tokens upon rotation
          await _secureStorage.write(
            key: AppConstants.prefToken,
            value: newAccess,
          );
          if (newRefresh != null && newRefresh.isNotEmpty) {
            await _secureStorage.write(
              key: AppConstants.prefRefreshToken,
              value: newRefresh,
            );
          }

          return _TokenRefreshResult(
            accessToken: newAccess,
            refreshToken: newRefresh ?? refreshToken,
            isSessionExpired: false,
          );
        }
      }
    } catch (_) {}

    return const _TokenRefreshResult();
  }

  /// Retries the failed request exactly once with the new access token.
  Future<void> _retryRequest(
    DioException err,
    String newAccessToken,
    ErrorInterceptorHandler handler, {
    String? newRefreshToken,
  }) async {
    err.requestOptions.extra['is_retry'] = true;
    err.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

    // If retrying a logout request, always update payload to the latest rotated refresh token
    if (err.requestOptions.path.contains('logout')) {
      final latestRefresh = newRefreshToken ??
          await _secureStorage.read(key: AppConstants.prefRefreshToken);
      if (latestRefresh != null && latestRefresh.isNotEmpty) {
        if (err.requestOptions.data is Map) {
          (err.requestOptions.data as Map)['refresh'] = latestRefresh;
        }
      }
    }

    try {
      _tokenRefreshDio ??= Dio(BaseOptions(
        connectTimeout: AppConstants.apiConnectTimeout,
        receiveTimeout: AppConstants.apiReceiveTimeout,
      ));

      final response = await _tokenRefreshDio!.fetch(err.requestOptions);
      return handler.resolve(response);
    } on DioException catch (retryErr) {
      return handler.next(retryErr);
    } catch (e) {
      return handler.next(err);
    }
  }

  Future<String?> _getCurrentAccessToken() async {
    try {
      return await _secureStorage.read(key: AppConstants.prefToken);
    } catch (_) {
      return null;
    }
  }

  Future<void> _handleSessionExpired() async {
    if (_isHandlingSessionExpiry) return;
    _isHandlingSessionExpiry = true;

    try {
      await _secureStorage.delete(key: AppConstants.prefToken);
      await _secureStorage.delete(key: AppConstants.prefRefreshToken);
      final getStorage = GetStorage();
      await getStorage.remove(AppConstants.prefIsLoggedIn);
      await getStorage.remove(AppConstants.prefUserData);
    } catch (_) {}

    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        AppRouter.router.go('/welcome');
      } catch (_) {}
      _isHandlingSessionExpiry = false;
    });
  }
}
