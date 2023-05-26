abstract class LogReporter {
  Future<void> init();
  void message(Object? object, {String tag = ''});
  void error({
    required dynamic error,
    StackTrace? stack,
    String tag = '',
    String? message,
    dynamic reason,
    bool fatal = false,
  });
}
