import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webrofm/core/database/encryption_service.dart';
import 'package:webrofm/core/database/local_database.dart';
import 'package:webrofm/core/network/api_response.dart';
import 'package:webrofm/core/network/dio_client.dart';
import 'package:webrofm/core/services/audio_cache_service.dart';
import 'package:webrofm/features/home/data/datasources/show_remote_source.dart';
import 'package:webrofm/features/home/data/repositories/show_repository_impl.dart';
import 'package:webrofm/features/home/domain/entities/category.dart';
import 'package:webrofm/features/home/domain/entities/continue_play.dart';
import 'package:webrofm/features/home/domain/entities/episode.dart';
import 'package:webrofm/features/home/domain/entities/preload_data.dart';
import 'package:webrofm/features/home/domain/entities/show.dart';
import 'package:webrofm/features/home/domain/repositories/show_repository.dart';

final showRemoteSourceProvider = Provider<ShowRemoteSource>((ref) {
  final dio = ref.watch(dioProvider);
  return ShowRemoteSource(dio);
});

final encryptionServiceProvider = Provider<EncryptionService>((ref) {
  final secureStorage = ref.watch(secureStorageProvider);
  return EncryptionService(secureStorage);
});

final localDatabaseProvider = Provider<LocalDatabase>((ref) {
  final encryptionService = ref.watch(encryptionServiceProvider);
  return LocalDatabase(encryptionService);
});

final audioCacheServiceProvider = Provider<AudioCacheService>((ref) {
  final dio = ref.watch(dioProvider);
  return AudioCacheService(dio);
});

final showRepositoryProvider = Provider<ShowRepository>((ref) {
  final remoteSource = ref.watch(showRemoteSourceProvider);
  final localDb = ref.watch(localDatabaseProvider);
  return ShowRepositoryImpl(remoteSource, localDb);
});

class HomeState {
  final List<Show> trending;
  final List<Show> newArrivals;
  final List<ContinuePlay> continuePlay;
  final List<ShowCategory> categories;
  final List<Episode> currentEpisodes;
  final List<Show> moreLikeThis;
  final bool isLoading;
  final String? error;
  final bool isTrendingLoading;
  final bool isNewArrivalsLoading;
  final bool isContinuePlayLoading;

  const HomeState({
    this.trending = const [],
    this.newArrivals = const [],
    this.continuePlay = const [],
    this.categories = const [],
    this.currentEpisodes = const [],
    this.moreLikeThis = const [],
    this.isLoading = false,
    this.error,
    this.isTrendingLoading = false,
    this.isNewArrivalsLoading = false,
    this.isContinuePlayLoading = false,
  });

  HomeState copyWith({
    List<Show>? trending,
    List<Show>? newArrivals,
    List<ContinuePlay>? continuePlay,
    List<ShowCategory>? categories,
    List<Episode>? currentEpisodes,
    List<Show>? moreLikeThis,
    bool? isLoading,
    String? error,
    bool? isTrendingLoading,
    bool? isNewArrivalsLoading,
    bool? isContinuePlayLoading,
  }) {
    return HomeState(
      trending: trending ?? this.trending,
      newArrivals: newArrivals ?? this.newArrivals,
      continuePlay: continuePlay ?? this.continuePlay,
      categories: categories ?? this.categories,
      currentEpisodes: currentEpisodes ?? this.currentEpisodes,
      moreLikeThis: moreLikeThis ?? this.moreLikeThis,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isTrendingLoading: isTrendingLoading ?? this.isTrendingLoading,
      isNewArrivalsLoading: isNewArrivalsLoading ?? this.isNewArrivalsLoading,
      isContinuePlayLoading: isContinuePlayLoading ?? this.isContinuePlayLoading,
    );
  }
}

class HomeNotifier extends StateNotifier<HomeState> {
  final ShowRepository _repository;

  HomeNotifier(this._repository) : super(const HomeState());

  Future<void> fetchAll({String? languageCode}) async {
    // 1. Load local data first (instant, works offline) — no loading spinner
    try {
      final localData = await _repository.getLocalPreload();
      if (localData != null && localData.shows.isNotEmpty) {
        state = state.copyWith(
          trending: localData.shows,
          // Don't prefill newArrivals from local — it must come from `recent` API key
          categories: localData.categories,
          isLoading: false,
        );
      } else {
        state = state.copyWith(isLoading: true, error: null);
      }
    } catch (_) {
      state = state.copyWith(isLoading: true, error: null);
    }

    // 2. Sync from API in background: preload + recent + continuePlay in parallel
    try {
      final results = await Future.wait([
        _repository.getPreload(languageCode: languageCode),
        _repository.getNewArrivalsFromApi(languageCode: languageCode),
        _repository.getContinuePlay(),
      ]);

      (results[0] as ApiResult<PreloadData>).fold(
        (failure) => state = state.copyWith(error: failure.message),
        (preload) {
          state = state.copyWith(
            trending: preload.shows,
            categories: preload.categories,
            isLoading: false,
          );
        },
      );

      // `recent` — backend order is final, no client-side sort/filter.
      // NEW chip: show if created_at is within 7 days (or backend isNew flag).
      (results[1] as ApiResult<List<Show>>).fold(
        (_) {},  // on failure, newArrivals stays empty — section stays hidden
        (recent) {
          final enriched = recent.map((s) {
            final isRecent = s.createdAt != null &&
                DateTime.now().difference(s.createdAt!).inDays < 7;
            return s.copyWith(isNew: s.isNew || isRecent);
          }).toList();
          state = state.copyWith(newArrivals: enriched);
        },
      );

      (results[2] as ApiResult<List<ContinuePlay>>).fold(
        (_) {},
        (items) => state = state.copyWith(continuePlay: items),
      );
    } catch (_) {}

    state = state.copyWith(isLoading: false);
  }

  Future<void> fetchTrending() async {
    state = state.copyWith(isTrendingLoading: true);
    final result = await _repository.getTrending();
    result.fold(
      (failure) => state = state.copyWith(
        isTrendingLoading: false,
        error: failure.message,
      ),
      (shows) => state = state.copyWith(
        trending: shows,
        isTrendingLoading: false,
      ),
    );
  }

  Future<void> fetchNewArrivals() async {
    state = state.copyWith(isNewArrivalsLoading: true);
    final result = await _repository.getNewArrivals();
    result.fold(
      (failure) => state = state.copyWith(
        isNewArrivalsLoading: false,
        error: failure.message,
      ),
      (shows) => state = state.copyWith(
        newArrivals: shows,
        isNewArrivalsLoading: false,
      ),
    );
  }

  Future<void> fetchContinuePlay() async {
    state = state.copyWith(isContinuePlayLoading: true);
    final result = await _repository.getContinuePlay();
    result.fold(
      (failure) => state = state.copyWith(
        isContinuePlayLoading: false,
        error: failure.message,
      ),
      (items) => state = state.copyWith(
        continuePlay: items,
        isContinuePlayLoading: false,
      ),
    );
  }

  Future<void> fetchCategories() async {
    final result = await _repository.getAllCategories();
    result.fold(
      (failure) => state = state.copyWith(error: failure.message),
      (categories) => state = state.copyWith(categories: categories),
    );
  }

  Future<void> fetchShowEpisodes(String showId) async {
    state = state.copyWith(isLoading: true);
    final episodesResult = await _repository.getShowEpisodes(showId);
    final moreShowsResult = await _repository.getMoreLikeThis(showId);
    episodesResult.fold(
      (failure) => state = state.copyWith(isLoading: false, error: failure.message),
      (episodes) => state = state.copyWith(currentEpisodes: episodes),
    );
    moreShowsResult.fold(
      (failure) => {},
      (shows) => state = state.copyWith(moreLikeThis: shows),
    );
    state = state.copyWith(isLoading: false);
  }

  void dismissContinueItem(String episodeId) {
    state = state.copyWith(
      continuePlay: state.continuePlay.where((c) => c.episodeId != episodeId).toList(),
    );
  }

  void clearContinueWatching() {
    state = state.copyWith(continuePlay: []);
  }

  Future<void> refresh({String? languageCode}) async {
    await fetchAll(languageCode: languageCode);
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

final homeNotifierProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  final repository = ref.watch(showRepositoryProvider);
  return HomeNotifier(repository);
});
