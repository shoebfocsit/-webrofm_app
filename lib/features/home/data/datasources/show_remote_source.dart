import 'package:dio/dio.dart';
import 'package:webrofm/core/constants/api_endpoints.dart';

class ShowRemoteSource {
  final Dio _dio;

  ShowRemoteSource(this._dio);

  /// GET /api/home/?language=<code>
  /// Returns {featured: [...], trending: [...], recent: [...]}.
  /// `recent` is already sorted created_at DESC by backend — do NOT re-sort.
  Future<Map<String, dynamic>> getHome({String? languageCode}) async {
    final useLanguage = languageCode != null &&
        languageCode.isNotEmpty &&
        languageCode != 'en';
    final query = useLanguage ? '?language=$languageCode' : '';
    final response = await _dio.get('${ApiEndpoints.home}$query');
    return response.data as Map<String, dynamic>;
  }

  /// GET /api/shows/?language=<code>&page=1
  /// Newest-first, page size 20. Powers the "See All" screen.
  Future<List<Map<String, dynamic>>> getShowsList({
    String? languageCode,
    int page = 1,
  }) async {
    final queryParams = <String, dynamic>{'page': page};
    if (languageCode != null && languageCode.isNotEmpty && languageCode != 'en') {
      queryParams['language'] = languageCode;
    }
    final response = await _dio.get(
      ApiEndpoints.showsList,
      queryParameters: queryParams,
    );
    final data = response.data;
    if (data is List) return data.cast<Map<String, dynamic>>();
    if (data is Map<String, dynamic>) {
      final results = data['results'];
      if (results is List) return results.cast<Map<String, dynamic>>();
    }
    return [];
  }

  Future<Map<String, dynamic>> getPreload({String? languageCode}) async {
    final useLanguage = languageCode != null && languageCode.isNotEmpty && languageCode != 'en';
    final query = useLanguage ? '?language=$languageCode' : '';
    final response = await _dio.get('${ApiEndpoints.homePreload}$query');
    var data = response.data as Map<String, dynamic>;
    if (useLanguage) {
      final shows = data['shows'];
      if (shows is List && shows.isEmpty) {
        final fallback = await _dio.get(ApiEndpoints.homePreload);
        data = fallback.data as Map<String, dynamic>;
      }
    }
    return data;
  }

  Future<List<Map<String, dynamic>>> getEpisodes(int showId) async {
    final response = await _dio.get(ApiEndpoints.showsEpisodes(showId));
    final data = response.data;
    if (data is List) {
      return data.cast<Map<String, dynamic>>();
    }
    if (data is Map<String, dynamic>) {
      final results = data['results'];
      if (results is List) {
        return results.cast<Map<String, dynamic>>();
      }
    }
    return [];
  }

  Future<Map<String, dynamic>> getFreshAudioUrl(int episodeId) async {
    final response = await _dio.get(ApiEndpoints.playEpisode(episodeId));
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getFreshVideoUrl(int episodeId) async {
    final response = await _dio.get(ApiEndpoints.playVideo(episodeId));
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> toggleLike(int episodeId) async {
    final response = await _dio.post(
      ApiEndpoints.likeToggle,
      data: {'episode_id': episodeId},
    );
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> toggleFavorite(int showId) async {
    final response = await _dio.post(
      ApiEndpoints.favoriteToggle,
      data: {'show_id': showId},
    );
    return response.data as Map<String, dynamic>;
  }

  Future<List<Map<String, dynamic>>> getFavorites() async {
    final response = await _dio.get(ApiEndpoints.favorites);
    final data = response.data;
    if (data is Map && data['results'] is List) {
      return (data['results'] as List).cast<Map<String, dynamic>>();
    }
    if (data is List) {
      return data.cast<Map<String, dynamic>>();
    }
    return [];
  }

  Future<List<Map<String, dynamic>>> getComments(int episodeId) async {
    final response =
        await _dio.get('${ApiEndpoints.comments}?episode=$episodeId');
    final data = response.data;
    if (data is List) {
      return data.cast<Map<String, dynamic>>();
    }
    return [];
  }

  Future<void> postComment(int episodeId, String text) async {
    await _dio.post(
      ApiEndpoints.comments,
      data: {'episode': episodeId, 'text': text},
    );
  }

  Future<void> submitFeedback(int episodeId, int rating, String comment) async {
    await _dio.post(
      ApiEndpoints.feedback,
      data: {'episode': episodeId, 'rating': rating, 'comment': comment},
    );
  }

  Future<void> updateResume(int episodeId, int positionSeconds) async {
    await _dio.post(
      ApiEndpoints.resumeUpdate,
      data: {
        'episode_id': episodeId,
        'last_position_seconds': positionSeconds,
      },
    );
  }

  Future<List<Map<String, dynamic>>> getResumeList() async {
    final response = await _dio.get(ApiEndpoints.resume);
    final data = response.data;
    if (data is List) {
      return data.cast<Map<String, dynamic>>();
    }
    return [];
  }

  Future<void> trackPlay(int episodeId) async {
    await _dio.post(
      ApiEndpoints.analyticsHit,
      data: {'episode_id': episodeId},
    );
  }
}
