import 'package:beer_app/service/track/logger.dart';
import 'package:dio/dio.dart';

class LoggingDecorator extends Interceptor {
  final Logger logger;
  final String tag;

  LoggingDecorator(this.logger, this.tag);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    logger.message(
      "--> ${options.method} ${options.uri.toString()}",
      tag: tag,
    );
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final request = response.requestOptions;
    logger.message(
      "<-- ${request.method} ${request.uri.toString()} ${response.data}",
      tag: tag,
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final request = err.requestOptions;
    logger.error(
      error: err,
      message: "<-- ${request.method} ${request.uri.toString()}",
      tag: tag,
    );
    super.onError(err, handler);
  }
}
