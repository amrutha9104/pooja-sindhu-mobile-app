import 'package:dio/dio.dart';
import 'package:pooja_sindhu/core/error/failure.dart';

Failure mapDioExceptionToFailure(DioException e) {
  if (e.type == DioExceptionType.connectionTimeout ||
      e.type == DioExceptionType.receiveTimeout ||
      e.type == DioExceptionType.connectionError) {
    return const NetworkFailure('No internet connection. Please try again.');
  }

  final status = e.response?.statusCode;
  final error = e.response?.data is Map<String, dynamic>
      ? e.response?.data['error'] as Map<String, dynamic>?
      : null;
  final code = error?['code'] as String?;
  final message = error?['message'] as String? ?? 'Something went wrong.';

  if (status == 401) {
    return UnauthorizedFailure(message);
  }
  if (status == 422) {
    final details = (error?['details'] as List?)?.cast<String>() ?? [];
    return ValidationFailure(message, details);
  }
  if (status != null && status >= 500) {
    return ServerFailure(message, code: code);
  }
  return UnknownFailure(message);
}
