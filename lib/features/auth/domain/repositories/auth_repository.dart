import 'dart:io';
import 'package:webrofm/core/error/failures.dart';
import 'package:webrofm/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<ApiResult<Map<String, dynamic>>> sendOtp(String phone);
  Future<ApiResult<User>> verifyOtp(String phone, String otp);
  Future<ApiResult<void>> logout();
  Future<ApiResult<void>> deleteAccount();
  Future<ApiResult<User>> getUser();
  Future<ApiResult<User>> updateUser(User user, {File? profilePicture});
  Future<bool> isLoggedIn();
  String? getToken();
}
