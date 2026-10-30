import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:webrofm/core/error/failures.dart';
import 'package:webrofm/features/auth/data/datasources/auth_local_source.dart';
import 'package:webrofm/features/auth/data/datasources/auth_remote_source.dart';
import 'package:webrofm/features/auth/data/models/user_dto.dart';
import 'package:webrofm/features/auth/domain/entities/user.dart';
import 'package:webrofm/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteSource _remoteSource;
  final AuthLocalSource _localSource;

  AuthRepositoryImpl(this._remoteSource, this._localSource);

  @override
  Future<ApiResult<Map<String, dynamic>>> sendOtp(String phone) async {
    try {
      final data = await _remoteSource.sendOtp(phone);
      return Right(data);
    } on DioException catch (e) {
      return Left(_mapDioFailure(e));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<User>> verifyOtp(String phone, String otp) async {
    try {
      final data = await _remoteSource.verifyOtp(phone, otp);
      final accessToken = (data['access'] ?? data['token']) as String?;
      final refreshToken = (data['refresh'] ?? data['refresh_token']) as String?;
      final userJson = data['user'] as Map<String, dynamic>?;
      if (accessToken == null || userJson == null) {
        return Left(const ApiFailure('Invalid response from server'));
      }
      final userDTO = UserDTO.fromJson(userJson);
      await _localSource.saveToken(accessToken);
      if (refreshToken != null && refreshToken.isNotEmpty) {
        await _localSource.saveRefreshToken(refreshToken);
      }
      await _localSource.saveUser(userDTO);
      await _localSource.setLoggedIn(true);
      return Right(userDTO.toDomain());
    } on DioException catch (e) {
      return Left(_mapDioFailure(e));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<void>> logout() async {
    try {
      final refreshToken = await _localSource.getRefreshToken();
      if (refreshToken != null) {
        await _remoteSource.logout(refreshToken);
      }
    } catch (_) {}
    await _localSource.clearAll();
    return const Right(null);
  }

  @override
  Future<ApiResult<void>> deleteAccount() async {
    await _localSource.clearAll();
    return const Right(null);
  }

  @override
  Future<ApiResult<User>> getUser() async {
    try {
      final data = await _remoteSource.getProfile();
      final userDTO = UserDTO.fromJson(data);
      await _localSource.saveUser(userDTO);
      return Right(userDTO.toDomain());
    } on DioException catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 403) {
        await _localSource.clearAll();
        return Left(_mapDioFailure(e));
      }
      final cached = _localSource.getUser();
      if (cached != null) {
        return Right(cached.toDomain());
      }
      return Left(_mapDioFailure(e));
    } catch (e) {
      final cached = _localSource.getUser();
      if (cached != null) {
        return Right(cached.toDomain());
      }
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<User>> updateUser(User user, {File? profilePicture}) async {
    try {
      final userDTO = UserDTO.fromDomain(user);
      final body = <String, dynamic>{
        'full_name': userDTO.name,
        'email': userDTO.email,
        'date_of_birth': userDTO.dateOfBirth,
        'interests': userDTO.categories.map((e) => int.tryParse(e) ?? 0).toList(),
      };
      if (userDTO.gender != null) body['gender'] = userDTO.gender;
      final data = await _remoteSource.updateProfile(body, profilePicture: profilePicture);
      final updatedDTO = UserDTO.fromJson(data);
      await _localSource.saveUser(updatedDTO);
      return Right(updatedDTO.toDomain());
    } on DioException catch (e) {
      return Left(_mapDioFailure(e));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    final token = await _localSource.getToken();
    return token != null && token.isNotEmpty;
  }

  @override
  String? getToken() {
    return null;
  }

  ApiFailure _mapDioFailure(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return const ApiFailure('Request timed out. Please try again.');
      case DioExceptionType.connectionError:
        return const ApiFailure('No internet connection.');
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final message = _extractServerMessage(e.response?.data) ??
            (e.message?.isNotEmpty == true ? e.message! : null);
        return ApiFailure(message ?? 'Something went wrong', statusCode: statusCode);
      default:
        return const ApiFailure('Something went wrong');
    }
  }

  /// Pulls a readable message out of the server error body. Handles Django
  /// style responses like {"detail": "..."}, {"message": "..."},
  /// {"error": "..."} and field validation errors such as
  /// {"phone_number": ["This field is required."]}.
  String? _extractServerMessage(dynamic data) {
    if (data is! Map) return null;
    for (final key in const ['message', 'detail', 'error', 'non_field_errors']) {
      final value = data[key];
      if (value != null) {
        if (value is String && value.isNotEmpty) return value;
        if (value is List && value.isNotEmpty) {
          final first = value.first;
          if (first is String && first.isNotEmpty) return first;
        }
      }
    }
    for (final entry in data.entries) {
      if (entry.key is String && !entry.key.startsWith('@')) {
        final value = entry.value;
        if (value is List && value.isNotEmpty && value.first is String) {
          return '${entry.key}: ${value.first}';
        }
        if (value is String && value.isNotEmpty && entry.key != 'message') {
          return value;
        }
      }
    }
    return null;
  }
}
