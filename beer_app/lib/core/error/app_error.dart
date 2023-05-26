typedef ErrorResolver = void Function();

class AppError {
  final dynamic source;
  final ErrorResolver? retryResolver, primaryResolver, secondaryResolver;

  AppError(
    this.source,
    this.retryResolver,
    this.primaryResolver,
    this.secondaryResolver,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppError &&
          runtimeType == other.runtimeType &&
          source == other.source;

  @override
  int get hashCode => source.hashCode;
}
