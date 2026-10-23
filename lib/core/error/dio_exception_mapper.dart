import 'package:dio/dio.dart';
import 'package:stockly/core/error/failure.dart';

Failure mapDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionError:
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.transformTimeout:
      return const NetworkFailure();

    case DioExceptionType.badResponse:
      final statusCode = e.response?.statusCode;

      if (statusCode == 401) {
        return const UnauthorizedFailure();
      }

      if (statusCode == 404) {
        return const NotFoundFailure();
      }

      if (statusCode != null && statusCode >= 500) {
        return const ServerFailure();
      }

      return const UnknownFailure();

    case DioExceptionType.cancel:
    case DioExceptionType.badCertificate:
    case DioExceptionType.unknown:
      return const UnknownFailure();
  }
}