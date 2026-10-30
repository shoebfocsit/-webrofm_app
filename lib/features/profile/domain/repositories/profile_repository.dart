import 'dart:io';

import 'package:webrofm/core/error/failures.dart';
import 'package:webrofm/features/auth/domain/entities/user.dart';
import 'package:webrofm/features/home/domain/entities/category.dart';
import 'package:webrofm/features/home/domain/entities/show.dart';

abstract class ProfileRepository {
  Future<ApiResult<User>> getProfile();
  Future<ApiResult<User>> updateProfile(User user, {File? profilePicture});
  Future<ApiResult<List<Show>>> getFavorites();
  Future<ApiResult<void>> addFavorite(String showId);
  Future<ApiResult<void>> removeFavorite(String showId);
  Future<ApiResult<bool>> isFavorite(String showId);
  Future<ApiResult<void>> clearHistory();
  Future<ApiResult<String?>> getLanguage();
  Future<ApiResult<void>> setLanguage(String language);
  Future<ApiResult<List<ShowCategory>>> getPreferredCategories();
  Future<ApiResult<void>> updatePreferredCategories(List<String> categoryIds);
}
