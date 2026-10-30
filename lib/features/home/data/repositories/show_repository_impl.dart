import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:webrofm/core/database/local_database.dart';
import 'package:webrofm/core/error/failures.dart';
import 'package:webrofm/features/home/data/datasources/show_remote_source.dart';
import 'package:webrofm/features/home/data/models/continue_play_dto.dart';
import 'package:webrofm/features/home/data/models/episode_dto.dart';
import 'package:webrofm/features/home/data/models/preload_data_dto.dart';
import 'package:webrofm/features/home/data/models/show_dto.dart';
import 'package:webrofm/features/home/domain/entities/category.dart';
import 'package:webrofm/features/home/domain/entities/continue_play.dart';
import 'package:webrofm/features/home/domain/entities/episode.dart';
import 'package:webrofm/features/home/domain/entities/preload_data.dart';
import 'package:webrofm/features/home/domain/entities/show.dart';
import 'package:webrofm/features/home/domain/repositories/show_repository.dart';

class ShowRepositoryImpl implements ShowRepository {
  final ShowRemoteSource _remoteSource;
  final LocalDatabase _localDb;

  ShowRepositoryImpl(this._remoteSource, this._localDb);

  @override
  Future<ApiResult<PreloadData>> getPreload({String? languageCode}) async {
    try {
      final data = await _remoteSource.getPreload(languageCode: languageCode);
      final apiHash = _contentHash(data);
      final lastHash = await _localDb.getSyncMetadata('api_content_hash');

      if (lastHash != apiHash) {
        final dto = PreloadDataDTO.fromJson(data);
        await _localDb.syncPreload(
          shows: dto.shows,
          categories: dto.categories,
          languages: dto.languages,
        );
        await _localDb.setSyncMetadata('api_content_hash', apiHash);

      }

      final cached = await _localDb.getAllCachedPreloadData();
      return Right(cached);
    } on DioException catch (e) {
      try {
        final cached = await _localDb.getAllCachedPreloadData();
        if (cached.shows.isNotEmpty) return Right(cached);
      } catch (_) {}
      return Left(_mapDioFailure(e));
    } catch (e) {
      try {
        final cached = await _localDb.getAllCachedPreloadData();
        if (cached.shows.isNotEmpty) return Right(cached);
      } catch (_) {}
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<PreloadData?> getLocalPreload() async {
    try {
      return await _localDb.getAllCachedPreloadData();
    } catch (_) {
      return null;
    }
  }

  @override
  Future<ApiResult<List<Show>>> getTrending() async {
    try {
      final cached = await _localDb.getAllCachedPreloadData();
      return Right(cached.shows);
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<List<Show>>> getNewArrivals() async {
    return getTrending();
  }

  @override
  Future<ApiResult<List<Show>>> getNewArrivalsFromApi({String? languageCode}) async {
    try {
      final data = await _remoteSource.getHome(languageCode: languageCode);
      // `recent` is already sorted created_at DESC by backend — preserve order.
      final recentRaw = data['recent'];
      if (recentRaw is List) {
        final shows = recentRaw
            .whereType<Map<String, dynamic>>()
            .map((json) => ShowDTO.fromJson(json, includeEpisodes: false).toDomain())
            .toList();
        return Right(shows);
      }
      return const Right([]);
    } on DioException catch (e) {
      return Left(_mapDioFailure(e));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<List<Show>>> getShowsList({
    String? languageCode,
    int page = 1,
  }) async {
    try {
      final data = await _remoteSource.getShowsList(
        languageCode: languageCode,
        page: page,
      );
      final shows = data
          .map((json) => ShowDTO.fromJson(json, includeEpisodes: false).toDomain())
          .toList();
      return Right(shows);
    } on DioException catch (e) {
      return Left(_mapDioFailure(e));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<List<Show>>> getCategoryShows(String category) async {
    try {
      final cached = await _localDb.getAllCachedPreloadData();
      final filtered = cached.shows
          .where((s) => s.category?.trim().toLowerCase() == category.trim().toLowerCase())
          .toList();
      if (filtered.isNotEmpty) return Right(filtered);
    } catch (_) {}

    try {
      final preloadResult = await _remoteSource.getPreload();
      final dto = PreloadDataDTO.fromJson(preloadResult);
      final filtered = dto.shows
          .where((s) => s.category?.trim().toLowerCase() == category.trim().toLowerCase())
          .map((s) => s.toDomain())
          .toList();
      return Right(filtered);
    } on DioException catch (e) {
      try {
        final cached = await _localDb.getAllCachedPreloadData();
        final filtered = cached.shows
            .where((s) => s.category?.trim().toLowerCase() == category.trim().toLowerCase())
            .toList();
        return Right(filtered);
      } catch (_) {}
      return Left(_mapDioFailure(e));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<List<ShowCategory>>> getAllCategories() async {
    try {
      final cached = await _localDb.getAllCachedPreloadData();
      return Right(cached.categories);
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<List<Episode>>> getShowEpisodes(String showId) async {
    try {
      final showIdInt = int.tryParse(showId);
      if (showIdInt == null) {
        return Left(const ApiFailure('Invalid show ID'));
      }

      final data = await _remoteSource.getEpisodes(showIdInt);
      final episodes = data.map((json) => EpisodeDTO.fromJson(json).toDomain()).toList();
      return Right(episodes);
    } on DioException catch (e) {
      return Left(_mapDioFailure(e));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<List<Show>>> getMoreLikeThis(String showId) async {
    try {
      final cached = await _localDb.getAllCachedPreloadData();
      return Right(cached.shows);
    } catch (_) {
      return Right([]);
    }
  }

  @override
  Future<ApiResult<List<ContinuePlay>>> getContinuePlay() async {
    try {
      final data = await _remoteSource.getResumeList();
      final items = data
          .map((json) => ContinuePlayDTO.fromJson(json).toDomain())
          .toList();
      return Right(items);
    } on DioException catch (e) {
      return Left(_mapDioFailure(e));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<List<Show>>> searchShows(String query) async {
    try {
      final cached = await _localDb.getAllCachedPreloadData();
      final lowerQuery = query.toLowerCase();
      final results = cached.shows.where((s) =>
          s.title.toLowerCase().contains(lowerQuery) ||
          (s.description?.toLowerCase().contains(lowerQuery) ?? false));
      return Right(results.toList());
    } catch (_) {
      return Right([]);
    }
  }

  @override
  Future<ApiResult<void>> updateContinuePlay(Episode episode, int position) async {
    try {
      final epId = int.tryParse(episode.id);
      if (epId == null) {
        return Left(const ApiFailure('Invalid episode ID'));
      }
      await _remoteSource.updateResume(epId, position);
      return const Right(null);
    } on DioException catch (e) {
      return Left(_mapDioFailure(e));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<bool>> toggleLike(int episodeId) async {
    try {
      final data = await _remoteSource.toggleLike(episodeId);
      return Right(data['is_liked'] as bool? ?? false);
    } on DioException catch (e) {
      return Left(_mapDioFailure(e));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<bool>> toggleFavorite(int showId) async {
    try {
      final data = await _remoteSource.toggleFavorite(showId);
      return Right(data['is_favorited'] as bool? ?? false);
    } on DioException catch (e) {
      return Left(_mapDioFailure(e));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  String _contentHash(Map<String, dynamic> data) {
    return sha256.convert(utf8.encode(jsonEncode(_withoutSignedQuery(data)))).toString();
  }

  dynamic _withoutSignedQuery(dynamic value) {
    if (value is Map) {
      return value.map(
        (key, item) => MapEntry(key, _withoutSignedQuery(item)),
      );
    }
    if (value is List) {
      return value.map(_withoutSignedQuery).toList();
    }
    if (value is String) {
      final uri = Uri.tryParse(value);
      if (uri != null && uri.hasQuery && uri.host.contains('r2.cloudflarestorage.com')) {
        return uri.replace(query: '', fragment: '').toString();
      }
    }
    return value;
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
        final message = (e.response?.data is Map)
            ? ((e.response?.data as Map)['message'] as String? ??
                'Something went wrong')
            : e.message ?? 'Something went wrong';
        return ApiFailure(message, statusCode: statusCode);
      default:
        return const ApiFailure('Something went wrong');
    }
  }
}
