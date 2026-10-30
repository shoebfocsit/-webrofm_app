import 'package:dio/dio.dart';
import 'package:webrofm/core/constants/api_endpoints.dart';

class CollabRemoteSource {
  final Dio _dio;

  CollabRemoteSource(this._dio);

  Future<Map<String, dynamic>> submitStory(String title, String content) async {
    final response = await _dio.post(
      ApiEndpoints.storySubmit,
      data: {'title': title, 'content': content},
    );
    return response.data as Map<String, dynamic>;
  }

  Future<List<dynamic>> getMyStories() async {
    final response = await _dio.get(ApiEndpoints.stories);
    return response.data as List<dynamic>;
  }

  Future<Map<String, dynamic>> submitAd({
    required String brandName,
    required String description,
    String? imagePath,
    String? targetUrl,
  }) async {
    final formData = FormData.fromMap({
      'brand_name': brandName,
      'description': description,
      if (imagePath != null)
        'ad_visual': await MultipartFile.fromFile(imagePath),
      if (targetUrl != null) 'target_url': targetUrl,
    });
    final response = await _dio.post(
      ApiEndpoints.adsSubmit,
      data: formData,
    );
    return response.data as Map<String, dynamic>;
  }

  Future<List<dynamic>> getMyAds() async {
    final response = await _dio.get(ApiEndpoints.ads);
    return response.data as List<dynamic>;
  }
}
