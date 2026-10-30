import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webrofm/core/network/dio_client.dart';
import 'package:webrofm/features/collab/data/datasources/collab_remote_source.dart';

final collabRemoteSourceProvider = Provider<CollabRemoteSource>((ref) {
  final dio = ref.watch(dioProvider);
  return CollabRemoteSource(dio);
});

class CollabState {
  final List<Map<String, dynamic>> stories;
  final List<Map<String, dynamic>> ads;
  final bool isLoading;
  final bool isSubmitting;
  final String? error;
  final String? submitSuccess;

  const CollabState({
    this.stories = const [],
    this.ads = const [],
    this.isLoading = false,
    this.isSubmitting = false,
    this.error,
    this.submitSuccess,
  });

  CollabState copyWith({
    List<Map<String, dynamic>>? stories,
    List<Map<String, dynamic>>? ads,
    bool? isLoading,
    bool? isSubmitting,
    String? error,
    String? submitSuccess,
  }) {
    return CollabState(
      stories: stories ?? this.stories,
      ads: ads ?? this.ads,
      isLoading: isLoading ?? this.isLoading,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      error: error,
      submitSuccess: submitSuccess,
    );
  }
}

class CollabNotifier extends StateNotifier<CollabState> {
  final CollabRemoteSource _source;

  CollabNotifier(this._source) : super(const CollabState());

  Future<void> fetchStories() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final data = await _source.getMyStories();
      state = state.copyWith(
        isLoading: false,
        stories: data.cast<Map<String, dynamic>>(),
      );
    } on DioException catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: _mapError(e),
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> fetchAds() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final data = await _source.getMyAds();
      state = state.copyWith(
        isLoading: false,
        ads: data.cast<Map<String, dynamic>>(),
      );
    } on DioException catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: _mapError(e),
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<bool> submitStory(String title, String content) async {
    state = state.copyWith(isSubmitting: true, error: null, submitSuccess: null);
    try {
      await _source.submitStory(title, content);
      state = state.copyWith(
        isSubmitting: false,
        submitSuccess: 'Story submitted successfully!',
      );
      await fetchStories();
      return true;
    } on DioException catch (e) {
      state = state.copyWith(
        isSubmitting: false,
        error: _mapError(e),
      );
      return false;
    } catch (e) {
      state = state.copyWith(
        isSubmitting: false,
        error: e.toString(),
      );
      return false;
    }
  }

  Future<bool> submitAd({
    required String brandName,
    required String description,
    String? imagePath,
    String? targetUrl,
  }) async {
    state = state.copyWith(isSubmitting: true, error: null, submitSuccess: null);
    try {
      await _source.submitAd(
        brandName: brandName,
        description: description,
        imagePath: imagePath,
        targetUrl: targetUrl,
      );
      state = state.copyWith(
        isSubmitting: false,
        submitSuccess: 'Ad submitted successfully!',
      );
      await fetchAds();
      return true;
    } on DioException catch (e) {
      state = state.copyWith(
        isSubmitting: false,
        error: _mapError(e),
      );
      return false;
    } catch (e) {
      state = state.copyWith(
        isSubmitting: false,
        error: e.toString(),
      );
      return false;
    }
  }

  void clearMessages() {
    state = state.copyWith(error: null, submitSuccess: null);
  }

  String _mapError(DioException e) {
    if (e.type == DioExceptionType.connectionError) return 'No internet connection.';
    if (e.response?.data is Map) {
      return (e.response?.data as Map)['message'] as String? ?? 'Something went wrong';
    }
    return 'Something went wrong';
  }
}

final collabProvider = StateNotifierProvider<CollabNotifier, CollabState>((ref) {
  final source = ref.watch(collabRemoteSourceProvider);
  return CollabNotifier(source);
});
