import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:webrofm/core/network/api_response.dart';

class ErrorHandler {
  ErrorHandler._();

  static ApiFailure handle(dynamic error, {String? fallbackMessage}) {
    if (error is DioException) {
      return _handleDioError(error);
    }
    if (error is ApiFailure) {
      return error;
    }
    if (error is TypeError) {
      return ApiFailure('A data error occurred. Please try again.', error: error);
    }
    if (error is FormatException) {
      return ApiFailure('Invalid data format received.', error: error);
    }
    return ApiFailure(fallbackMessage ?? 'An unexpected error occurred.', error: error);
  }

  static ApiFailure _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiFailure(
          'Connection timed out. Please check your internet connection.',
          statusCode: error.response?.statusCode,
          error: error,
        );
      case DioExceptionType.connectionError:
        return ApiFailure(
          'No internet connection. Please check your network settings.',
          error: error,
        );
      case DioExceptionType.badResponse:
        return _handleStatusCode(error.response);
      case DioExceptionType.cancel:
        return ApiFailure('Request was cancelled.', error: error);
      case DioExceptionType.badCertificate:
        return ApiFailure('Connection security error. Please update your app.', error: error);
      case DioExceptionType.unknown:
        return ApiFailure(
          error.message ?? 'An unexpected network error occurred.',
          error: error,
        );
      default:
        return ApiFailure('An unexpected network error occurred.', error: error);
    }
  }

  static ApiFailure _handleStatusCode(Response? response) {
    final statusCode = response?.statusCode;
    final data = response?.data;
    final serverMessage = data is Map
        ? (data['message'] ?? data['error'] ?? data['detail'] ?? '')
        : '';

    if (serverMessage.isNotEmpty) {
      return ApiFailure(serverMessage, statusCode: statusCode, error: response);
    }

    switch (statusCode) {
      case 400:
        return ApiFailure('Invalid request. Please verify your input.', statusCode: statusCode, error: response);
      case 401:
        return ApiFailure('Session expired. Please sign in again.', statusCode: statusCode, error: response);
      case 403:
        return ApiFailure('You do not have permission to perform this action.', statusCode: statusCode, error: response);
      case 404:
        return ApiFailure('The requested resource was not found.', statusCode: statusCode, error: response);
      case 409:
        return ApiFailure('Conflict detected. The resource may have been updated.', statusCode: statusCode, error: response);
      case 422:
        return ApiFailure('Validation failed. Please check your input.', statusCode: statusCode, error: response);
      case 429:
        return ApiFailure('Too many requests. Please try again later.', statusCode: statusCode, error: response);
      case 500:
        return ApiFailure('Server error. Please try again later.', statusCode: statusCode, error: response);
      case 502:
        return ApiFailure('Service temporarily unavailable. Please try again.', statusCode: statusCode, error: response);
      case 503:
        return ApiFailure('Service is under maintenance. Please try again later.', statusCode: statusCode, error: response);
      default:
        return ApiFailure('Something went wrong. (Error $statusCode)', statusCode: statusCode, error: response);
    }
  }

  static String getUserFriendlyMessage(dynamic error) {
    if (error is ApiFailure) return error.message;
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return 'Connection timed out. Please try again.';
        case DioExceptionType.connectionError:
          return 'No internet connection.';
        case DioExceptionType.badResponse:
          final code = error.response?.statusCode;
          final data = error.response?.data;
          if (data is Map) {
            return data['message'] ?? data['error'] ?? 'Server error ($code)';
          }
          return 'Server error ($code)';
        default:
          return 'An unexpected error occurred.';
      }
    }
    if (error is Exception) {
      debugPrint('[ErrorHandler] Exception: $error');
      return 'Something went wrong. Please try again.';
    }
    return 'An unexpected error occurred.';
  }

  static bool isNetworkError(dynamic error) {
    if (error is DioException) {
      return error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.sendTimeout ||
          error.type == DioExceptionType.receiveTimeout ||
          error.type == DioExceptionType.connectionError;
    }
    return false;
  }

  static bool isAuthError(dynamic error) {
    if (error is DioException) return error.response?.statusCode == 401;
    if (error is ApiFailure) return error.statusCode == 401;
    return false;
  }

  static bool isServerError(dynamic error) {
    if (error is DioException) {
      final code = error.response?.statusCode;
      return code != null && code >= 500 && code < 600;
    }
    if (error is ApiFailure) {
      return error.statusCode != null && error.statusCode! >= 500 && error.statusCode! < 600;
    }
    return false;
  }
}
