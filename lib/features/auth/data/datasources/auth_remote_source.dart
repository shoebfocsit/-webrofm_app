import 'dart:io';
import 'package:dio/dio.dart';
import 'package:webrofm/core/constants/api_endpoints.dart';

class AuthRemoteSource {
  final Dio _dio;

  AuthRemoteSource(this._dio);

  Future<Map<String, dynamic>> sendOtp(String phone) async {
    final cleanPhone = phone.replaceAll('+', '');
    final response = await _dio.post(
      ApiEndpoints.sendOtp,
      data: {'phone_number': cleanPhone},
    );
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> verifyOtp(String phone, String otp) async {
    final cleanPhone = phone.replaceAll('+', '');
    final response = await _dio.post(
      ApiEndpoints.verifyOtp,
      data: {'phone_number': cleanPhone, 'otp_code': otp},
    );
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getProfile() async {
    final response = await _dio.get(ApiEndpoints.profile);
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> updateProfile(Map<String, dynamic> data, {File? profilePicture}) async {
    if (profilePicture != null) {
      final formData = FormData.fromMap({
        ...data,
        'profile_picture': await MultipartFile.fromFile(profilePicture.path, filename: profilePicture.path.split('\\').last),
      });
      final response = await _dio.post(ApiEndpoints.profile, data: formData);
      return response.data as Map<String, dynamic>;
    }
    final response = await _dio.post(ApiEndpoints.profile, data: data);
    return response.data as Map<String, dynamic>;
  }

  Future<void> logout(String refreshToken) async {
    await _dio.post(ApiEndpoints.logout, data: {'refresh': refreshToken});
  }
}
