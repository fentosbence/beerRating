import 'dart:io';

import 'package:beer_app/app/ioc.dart';
import 'package:beer_app/core/error/exceptions.dart';
import 'package:dio/dio.dart';

class ExceptionMapper {
  ExceptionMapper();

  AppException mapError(dynamic e) {
    switch (e.runtimeType) {
      case DioError:
        return mapDioError(e);
      case ApiException:
      case AppException:
        return e;
      default:
        return _mapUnknown(e);
    }
  }

  AppException mapDioError(DioError e) {
    switch (e.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
        return NetworkException(e);
      case DioErrorType.unknown:
        if (isNetworkError(e.error)) {
          return NetworkException(e);
        } else {
          return _mapUnknown(e);
        }
      case DioErrorType.badResponse:
        if (e.response != null) {
          return _mapErrorResponse(e.response!);
        } else {
          return _mapUnknown(e);
        }
      default:
        return _mapUnknown(e);
    }
  }

  // TODO: consider parsing the error response if it has domain specific meaning
  AppException _mapErrorResponse(Response response) {
    return ApiException(response, response.statusCode!);
  }

  bool isNetworkError(dynamic e) {
    return e is SocketException || e is TlsException || e is IOException;
  }

  AppException _mapUnknown(dynamic e) {
    IoC.logger.error(
      error: e,
      message: "Unknown exception",
      tag: "ExceptionMapper",
    );
    return AppException(e, "Unknown exception");
  }
}
