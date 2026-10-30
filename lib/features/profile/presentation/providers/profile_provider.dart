import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:webrofm/features/auth/domain/entities/user.dart';
import 'package:webrofm/features/auth/presentation/providers/auth_provider.dart';
import 'package:webrofm/features/home/presentation/providers/home_provider.dart';
import 'package:webrofm/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:webrofm/features/profile/domain/repositories/profile_repository.dart';

final isLoggedInProvider = Provider<bool>((ref) {
  final authState = ref.watch(authProvider);
  return authState.isLoggedIn;
});

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepositoryImpl(
    ref.read(authRemoteSourceProvider),
    ref.read(authLocalSourceProvider),
    ref.read(showRemoteSourceProvider),
    GetStorage(),
  );
});

class ProfileState {
  final User? user;
  final bool isLoading;
  final String? error;

  const ProfileState({
    this.user,
    this.isLoading = false,
    this.error,
  });

  ProfileState copyWith({
    User? user,
    bool? isLoading,
    String? error,
  }) {
    return ProfileState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class ProfileNotifier extends StateNotifier<ProfileState> {
  final ProfileRepository _repository;

  ProfileNotifier(this._repository) : super(const ProfileState());

  Future<void> fetchProfile() async {
    state = state.copyWith(isLoading: true, error: null);
    final result = await _repository.getProfile();
    result.fold(
      (failure) => state = state.copyWith(isLoading: false, error: failure.message),
      (user) => state = state.copyWith(isLoading: false, user: user),
    );
  }

  Future<void> updateProfile(User updatedUser, {File? profilePicture}) async {
    state = state.copyWith(isLoading: true, error: null);
    final result = await _repository.updateProfile(updatedUser, profilePicture: profilePicture);
    result.fold(
      (failure) => state = state.copyWith(isLoading: false, error: failure.message),
      (user) => state = state.copyWith(isLoading: false, user: user),
    );
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

final profileProvider = StateNotifierProvider<ProfileNotifier, ProfileState>((ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return ProfileNotifier(repository);
});
