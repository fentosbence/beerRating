import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

import 'log_reporter.dart';

class ConsoleLogReporter extends LogReporter {
  ConsoleLogReporter();

  @override
  Future<void> init() async {}

  @override
  void message(Object? object, {String tag = ''}) {
    const level = 300;

    if (object is Iterable) {
      for (var o in object) {
        developer.log('$o', name: tag, level: level);
      }
    } else if (object is Map) {
      for (var i in object.entries) {
        developer.log('${i.key} - ${i.value}', name: tag, level: level);
      }
    } else {
      developer.log('$object', name: tag, level: level);
    }
  }

  @override
  void error({
    required error,
    StackTrace? stack,
    String tag = '',
    String? message,
    reason,
    bool fatal = false,
  }) {
    if (_shouldIgnore()) return;

    final msg = message ?? 'Error';
    developer.log(
      msg,
      name: tag,
      error: error,
      stackTrace: stack,
      level: 1000,
    );
  }

  bool _shouldIgnore() {
    return !kDebugMode;
  }
}
