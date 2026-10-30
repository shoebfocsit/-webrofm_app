import 'package:fpdart/fpdart.dart';

typedef ApiResult<T> = Either<ApiFailure, T>;

class ApiFailure {
  final String message;
  final int? statusCode;
  final dynamic error;

  const ApiFailure(this.message, {this.statusCode, this.error});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApiFailure &&
          runtimeType == other.runtimeType &&
          message == other.message &&
          statusCode == other.statusCode;

  @override
  int get hashCode => message.hashCode ^ statusCode.hashCode;

  @override
  String toString() => 'ApiFailure(message: $message, statusCode: $statusCode)';

  ApiFailure copyWith({
    String? message,
    int? statusCode,
    dynamic error,
  }) {
    return ApiFailure(
      message ?? this.message,
      statusCode: statusCode ?? this.statusCode,
      error: error ?? this.error,
    );
  }
}

extension ApiResultExtension<T> on ApiResult<T> {
  T? getOrNull() => fold((_) => null, (data) => data);

  T getOrDefault(T defaultValue) => fold((_) => defaultValue, (data) => data);

  T getOrElse(T Function() defaultValue) =>
      fold((_) => defaultValue(), (data) => data);

  bool get isSuccess => fold((_) => false, (_) => true);

  bool get isFailure => !isSuccess;

  ApiFailure? get failure => fold((failure) => failure, (_) => null);

  T? get data => fold((_) => null, (data) => data);
}

extension FutureApiResultExtension<T> on Future<ApiResult<T>> {
  Future<T?> getOrNull() => then((result) => result.getOrNull());

  Future<T> getOrDefault(T defaultValue) =>
      then((result) => result.getOrDefault(defaultValue));
}

ApiResult<T> success<T>(T data) => Right<ApiFailure, T>(data);

ApiResult<T> failure<T>(ApiFailure failure) => Left<ApiFailure, T>(failure);

ApiResult<T> failureMessage<T>(String message, {int? statusCode, dynamic error}) =>
    Left<ApiFailure, T>(ApiFailure(message, statusCode: statusCode, error: error));
