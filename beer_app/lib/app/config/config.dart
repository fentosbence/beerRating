class Config {
  final String baseApiUrl;
  final Duration requestTimeout;

  Config({
    required this.baseApiUrl,
    this.requestTimeout = const Duration(seconds: 15),
  });
}
