import 'dart:io';

import 'package:beer_app/api/parser.dart';
import 'package:beer_app/api/request_decorator.dart';
import 'package:beer_app/app/config/config.dart';
import 'package:beer_app/core/error/exception_mapper.dart';
import 'package:dio/dio.dart';

import '../core/error/exceptions.dart';
import '../service/track/logger.dart';

class ApiClient {
  final Dio _dio;
  final ExceptionMapper _exceptionMapper;

  ApiClient(this._dio, this._exceptionMapper);

  factory ApiClient.create({
    required Config config,
    required Logger logger,
    required ExceptionMapper exceptionMapper,
  }) {
    final dio = Dio(BaseOptions(
      baseUrl: config.baseApiUrl,
      connectTimeout: config.requestTimeout,
      receiveTimeout: config.requestTimeout,
      sendTimeout: config.requestTimeout,
    ));
    dio.interceptors.addAll([
      LoggingDecorator(logger, Logger.tagApi),
    ]);

    return ApiClient(dio, exceptionMapper);
  }

  Future<T> get<T>({
    required String path,
    required Mapper<T> mapper,
    Map<String, dynamic>? params,
  }) async {
    try {
      final response = await _dio.get(path, queryParameters: params);

      if (response.statusCode == HttpStatus.ok) {
        return _mapResponseOrThrow(response: response, mapper: mapper);
      } else {
        throw ApiException(response, response.statusCode!);
      }
    } on DioError catch (e) {
      throw _exceptionMapper.mapDioError(e);
    } catch (e) {
      throw _exceptionMapper.mapError(e);
    }
  }

  T _mapResponseOrThrow<T>({
    required Response<dynamic> response,
    required Mapper<T> mapper,
  }) {
    try {
      return mapper(response.data);
    } on TypeError catch (e) {
      throw ResponseException(
        source: e,
        statusCode: response.statusCode,
        method: response.requestOptions.method,
        path: response.requestOptions.path,
        message: e.toString(),
        response: response.data,
      );
    }
  }
}
