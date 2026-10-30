import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get_storage/get_storage.dart';
import 'package:webrofm/core/constants/app_constants.dart';
import 'package:webrofm/core/error/failures.dart';
import 'package:webrofm/features/auth/data/datasources/auth_local_source.dart';
import 'package:webrofm/features/auth/data/datasources/auth_remote_source.dart';
import 'package:webrofm/features/auth/data/models/user_dto.dart';
import 'package:webrofm/features/auth/domain/entities/user.dart';
import 'package:webrofm/features/home/data/datasources/show_remote_source.dart';
import 'package:webrofm/features/home/data/models/category_dto.dart';
import 'package:webrofm/features/home/data/models/show_dto.dart';
import 'package:webrofm/features/home/domain/entities/category.dart';
import 'package:webrofm/features/home/domain/entities/show.dart';
import 'package:webrofm/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final AuthRemoteSource _authRemote;
  final AuthLocalSource _authLocal;
  final ShowRemoteSource _showRemote;
  final GetStorage _getStorage;

  ProfileRepositoryImpl(
    this._authRemote,
    this._authLocal,
    this._showRemote,
    this._getStorage,
  );

  @override
  Future<ApiResult<User>> getProfile() async {
    try {
      final data = await _authRemote.getProfile();
      final userDTO = UserDTO.fromJson(data);
      await _authLocal.saveUser(userDTO);
      return Right(userDTO.toDomain());
    } on DioException catch (e) {
      final cached = _authLocal.getUser();
      if (cached != null) {
        return Right(cached.toDomain());
      }
      return Left(_mapDioFailure(e));
    } catch (e) {
      final cached = _authLocal.getUser();
      if (cached != null) {
        return Right(cached.toDomain());
      }
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<User>> updateProfile(
    User user, {
    File? profilePicture,
  }) async {
    try {
      final userDTO = UserDTO.fromDomain(user);
      final body = <String, dynamic>{
        'full_name': userDTO.name,
        'email': userDTO.email,
        'date_of_birth': userDTO.dateOfBirth,
        'interests':
            userDTO.categories.map((e) => int.tryParse(e) ?? 0).toList(),
      };
      if (userDTO.gender != null) body['gender'] = userDTO.gender;
      final data = await _authRemote.updateProfile(body, profilePicture: profilePicture);
      final updatedDTO = UserDTO.fromJson(data);
      await _authLocal.saveUser(updatedDTO);
      return Right(updatedDTO.toDomain());
    } on DioException catch (e) {
      return Left(_mapDioFailure(e));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<List<Show>>> getFavorites() async {
    try {
      final data = await _showRemote.getFavorites();
      final shows = data
          .where((json) => json['show'] != null)
          .map((json) =>
              ShowDTO.fromJson(json['show'] as Map<String, dynamic>)
                  .toDomain())
          .toList();
      return Right(shows);
    } on DioException catch (e) {
      return Left(_mapDioFailure(e));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<void>> addFavorite(String showId) async {
    try {
      final id = int.tryParse(showId);
      if (id == null) return Left(const ApiFailure('Invalid show ID'));
      await _showRemote.toggleFavorite(id);
      return const Right(null);
    } on DioException catch (e) {
      return Left(_mapDioFailure(e));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<void>> removeFavorite(String showId) async {
    try {
      final id = int.tryParse(showId);
      if (id == null) return Left(const ApiFailure('Invalid show ID'));
      await _showRemote.toggleFavorite(id);
      return const Right(null);
    } on DioException catch (e) {
      return Left(_mapDioFailure(e));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<bool>> isFavorite(String showId) async {
    return Right(false);
  }

  @override
  Future<ApiResult<void>> clearHistory() async {
    try {
      await _getStorage.remove(AppConstants.prefContinuePlay);
      await _getStorage.remove(AppConstants.prefRecentSearches);
      return const Right(null);
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<String?>> getLanguage() async {
    try {
      final lang = _getStorage.read<String>(AppConstants.prefLanguage);
      return Right(lang);
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<void>> setLanguage(String language) async {
    try {
      await _getStorage.write(AppConstants.prefLanguage, language);
      return const Right(null);
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<List<ShowCategory>>> getPreferredCategories() async {
    try {
      final data = await _showRemote.getPreload();
      final categories = (data['categories'] as List<dynamic>?)
              ?.map((e) =>
                  ShowCategoryDTO.fromJson(e as Map<String, dynamic>)
                      .toDomain())
              .toList() ??
          [];
      return Right(categories);
    } on DioException catch (e) {
      return Left(_mapDioFailure(e));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<void>> updatePreferredCategories(
    List<String> categoryIds,
  ) async {
    try {
      await _authRemote.updateProfile({
        'interests': categoryIds.map((e) => int.tryParse(e) ?? 0).toList(),
      });
      return const Right(null);
    } on DioException catch (e) {
      return Left(_mapDioFailure(e));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
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
