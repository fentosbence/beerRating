import 'dart:io';

class AppException implements Exception {
  final dynamic source;
  final String? message;

  AppException(this.source, [this.message]);

  @override
  String toString() => message ?? source.toString();
}

class NetworkException extends AppException {
  NetworkException(super.source);
}

class ResponseException extends AppException {
  final int? statusCode;
  final String? method, path;
  final dynamic response;

  ResponseException({
    required dynamic source,
    String? message,
    this.statusCode,
    this.method,
    this.path,
    this.response,
  }) : super(source, message);
}

class ApiException extends AppException {
  final int statusCode;

  ApiException(super.source, this.statusCode);

  @override
  String toString() => "$statusCode ${super.source.toString()}";
}

class BadRequestException extends ApiException {
  BadRequestException(dynamic source) : super(source, HttpStatus.badRequest);
}

class UnauthorizedException extends ApiException {
  UnauthorizedException(dynamic source)
      : super(source, HttpStatus.unauthorized);
}

class ForbiddenException extends ApiException {
  ForbiddenException(dynamic source) : super(source, HttpStatus.forbidden);
}

class NotFoundException extends ApiException {
  NotFoundException(dynamic source) : super(source, HttpStatus.notFound);
}

class InternalServerErrorException extends ApiException {
  InternalServerErrorException(dynamic source)
      : super(source, HttpStatus.internalServerError);
}
