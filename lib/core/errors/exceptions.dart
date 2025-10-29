/// Base exception class
class AppException implements Exception {
  final String message;
  final String? code;

  AppException(this.message, {this.code});

  @override
  String toString() => message;
}

/// Thrown when there's a server error (5xx)
class ServerException extends AppException {
  ServerException([String message = 'Server error occurred'])
      : super(message, code: 'SERVER_ERROR');
}

/// Thrown when request is invalid (4xx)
class BadRequestException extends AppException {
  BadRequestException([String message = 'Bad request'])
      : super(message, code: 'BAD_REQUEST');
}

/// Thrown when user is not authenticated (401)
class UnauthorizedException extends AppException {
  UnauthorizedException([String message = 'Unauthorized access'])
      : super(message, code: 'UNAUTHORIZED');
}

/// Thrown when user doesn't have permission (403)
class ForbiddenException extends AppException {
  ForbiddenException([String message = 'Access forbidden'])
      : super(message, code: 'FORBIDDEN');
}

/// Thrown when resource is not found (404)
class NotFoundException extends AppException {
  NotFoundException([String message = 'Resource not found'])
      : super(message, code: 'NOT_FOUND');
}

/// Thrown when there's a network/connection error
class NetworkException extends AppException {
  NetworkException([String message = 'Network error. Please check your connection'])
      : super(message, code: 'NETWORK_ERROR');
}

/// Thrown when request times out
class TimeoutException extends AppException {
  TimeoutException([String message = 'Request timeout'])
      : super(message, code: 'TIMEOUT');
}

/// Thrown when there's a data parsing error
class ParseException extends AppException {
  ParseException([String message = 'Failed to parse data'])
      : super(message, code: 'PARSE_ERROR');
}

/// Thrown when there's a cache error
class CacheException extends AppException {
  CacheException([String message = 'Cache error occurred'])
      : super(message, code: 'CACHE_ERROR');
}