import 'dart:async';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webrofm/core/network/dio_client.dart';
import 'package:webrofm/features/auth/data/datasources/auth_local_source.dart';
import 'package:webrofm/features/auth/data/datasources/auth_remote_source.dart';
import 'package:webrofm/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:webrofm/features/auth/domain/entities/user.dart';
import 'package:webrofm/features/auth/domain/repositories/auth_repository.dart';
import 'package:get_storage/get_storage.dart';

final getStorageProvider = Provider<GetStorage>((ref) => GetStorage());

final authLocalSourceProvider = Provider<AuthLocalSource>((ref) {
  return AuthLocalSource(
    ref.read(secureStorageProvider),
    ref.read(getStorageProvider),
  );
});

final authRemoteSourceProvider = Provider<AuthRemoteSource>((ref) {
  return AuthRemoteSource(ref.read(dioProvider));
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    ref.read(authRemoteSourceProvider),
    ref.read(authLocalSourceProvider),
  );
});

class AuthState {
  final bool isLoading;
  final String? error;
  final String? phone;
  final bool isLoggedIn;
  final User? user;
  final int otpTimerSeconds;
  final bool otpRateLimited;
  final int? remaining;

  const AuthState({
    this.isLoading = false,
    this.error,
    this.phone,
    this.isLoggedIn = false,
    this.user,
    this.otpTimerSeconds = 0,
    this.otpRateLimited = false,
    this.remaining,
  });

  AuthState copyWith({
    bool? isLoading,
    String? error,
    String? phone,
    bool? isLoggedIn,
    User? user,
    int? otpTimerSeconds,
    bool? otpRateLimited,
    int? remaining,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      phone: phone ?? this.phone,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      user: user ?? this.user,
      otpTimerSeconds: otpTimerSeconds ?? this.otpTimerSeconds,
      otpRateLimited: otpRateLimited ?? this.otpRateLimited,
      remaining: remaining,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;
  final AuthLocalSource _localSource;
  Timer? _otpTimer;

  AuthNotifier(this._authRepository, this._localSource)
      : super(AuthState(
          isLoggedIn: _localSource.isLoggedIn(),
          user: _localSource.getUser()?.toDomain(),
        ));

  Future<void> sendOtp(String phone) async {
    state = state.copyWith(isLoading: true, error: null, phone: phone, otpRateLimited: false, remaining: null);
    final result = await _authRepository.sendOtp(phone);
    result.fold(
      (failure) {
        if (failure.statusCode == 429) {
          state = state.copyWith(isLoading: false, error: null, otpRateLimited: true, remaining: 0);
        } else {
          state = state.copyWith(isLoading: false, error: failure.message);
        }
      },
      (data) => state = state.copyWith(
        isLoading: false,
        error: null,
        otpRateLimited: false,
        remaining: data['remaining'] as int?,
      ),
    );
  }

  Future<void> verifyOtp(String otp) async {
    if (state.phone == null) return;
    state = state.copyWith(isLoading: true, error: null);
    final result = await _authRepository.verifyOtp(state.phone!, otp);
    result.fold(
      (failure) => state = state.copyWith(isLoading: false, error: failure.message),
      (user) => state = state.copyWith(isLoading: false, isLoggedIn: true, user: user, error: null),
    );
  }

  Future<void> logout() async {
    state = state.copyWith(isLoading: true);
    final result = await _authRepository.logout();
    result.fold(
      (failure) => state = state.copyWith(isLoading: false, error: failure.message),
      (_) => state = const AuthState(),
    );
  }

  void forceLogout() {
    _otpTimer?.cancel();
    state = const AuthState();
  }

  Future<void> getUser() async {
    await restoreSession();
  }

  Future<bool> restoreSession() async {
    state = state.copyWith(isLoading: true, error: null);
    final result = await _authRepository.getUser();
    return result.fold(
      (failure) {
        // If 401/403 or storage was cleared, user is truly unauthenticated
        if (failure.statusCode == 401 ||
            failure.statusCode == 403 ||
            !_localSource.isLoggedIn()) {
          state = const AuthState();
          return false;
        }
        // Network timeout / offline: keep user logged in with cached data!
        final cached = _localSource.getUser();
        state = state.copyWith(
          isLoading: false,
          isLoggedIn: _localSource.isLoggedIn(),
          user: cached?.toDomain(),
          error: null,
        );
        return _localSource.isLoggedIn();
      },
      (user) {
        state = state.copyWith(
          isLoading: false,
          user: user,
          isLoggedIn: true,
          error: null,
        );
        return true;
      },
    );
  }

  Future<void> updateProfile(User user, {File? profilePicture}) async {
    state = state.copyWith(isLoading: true, error: null);
    final result = await _authRepository.updateUser(user, profilePicture: profilePicture);
    result.fold(
      (failure) => state = state.copyWith(isLoading: false, error: failure.message),
      (updated) => state = state.copyWith(isLoading: false, user: updated, isLoggedIn: true, error: null),
    );
  }

  void startOtpTimer() {
    state = state.copyWith(otpTimerSeconds: 30);
    _otpTimer?.cancel();
    _otpTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.otpTimerSeconds <= 1) {
        timer.cancel();
        state = state.copyWith(otpTimerSeconds: 0);
      } else {
        state = state.copyWith(otpTimerSeconds: state.otpTimerSeconds - 1);
      }
    });
  }

  void resetError() {
    state = state.copyWith(error: null);
  }

  @override
  void dispose() {
    _otpTimer?.cancel();
    super.dispose();
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(
    ref.read(authRepositoryProvider),
    ref.read(authLocalSourceProvider),
  );
});
