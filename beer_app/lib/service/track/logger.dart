import 'dart:io';

import 'package:flutter/foundation.dart';

import 'log_reporter.dart';

class Logger {
  static const tagFlutter = "FLUTTER";
  static const tagPlatform = "PLATFORM";
  static const tagZoned = "ZONED";
  static const tagError = "ERROR";
  static const tagApi = "API";

  final LogReporter _reporter;

  Logger(this._reporter);

  Future<void> init() async {
    await _reporter.init();
    FlutterError.onError = _trackFlutterError;
    PlatformDispatcher.instance.onError = (e, stack) {
      error(error: e, stack: stack, tag: tagPlatform);
      return true;
    };
  }

  void _trackFlutterError(FlutterErrorDetails details) {
    FlutterError.presentError(details);
    if (details.exception is SocketException) {
      return;
    }
    if (details.library == 'image resource service') {
      return;
    }
    message("library: ${details.library}", tag: tagFlutter);
    error(
      tag: tagFlutter,
      error: details.exceptionAsString(),
      stack: details.stack,
      reason: details.context,
    );
  }

  void message(Object? object, {String tag = ''}) {
    _reporter.message(object, tag: tag);
  }

  void error({
    required dynamic error,
    StackTrace? stack,
    String tag = '',
    String? message,
    dynamic reason,
    bool fatal = false,
  }) {
    _reporter.error(
      error: error,
      stack: stack,
      tag: tag,
      message: message,
      reason: reason,
      fatal: fatal,
    );
  }
}
