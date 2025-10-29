import 'package:equatable/equatable.dart';

/// Base failure class
abstract class Failure extends Equatable {
  final String message;
  final String? code;

  const Failure(this.message, {this.code});

  @override
  List<Object?> get props => [message, code];
}

/// Server failure (5xx errors)
class ServerFailure extends Failure {
  const ServerFailure([String message = 'Server error occurred'])
      : super(message, code: 'SERVER_ERROR');
}

/// Network failure (no internet)
class NetworkFailure extends Failure {
  const NetworkFailure([String message = 'No internet connection'])
      : super(message, code: 'NETWORK_ERROR');
}

/// Authentication failure (401)
class AuthenticationFailure extends Failure {
  const AuthenticationFailure([String message = 'Authentication failed'])
      : super(message, code: 'AUTH_ERROR');
}

/// Authorization failure (403)
class AuthorizationFailure extends Failure {
  const AuthorizationFailure([String message = 'Access denied'])
      : super(message, code: 'AUTHORIZATION_ERROR');
}

/// Not found failure (404)
class NotFoundFailure extends Failure {
  const NotFoundFailure([String message = 'Resource not found'])
      : super(message, code: 'NOT_FOUND');
}

/// Bad request failure (400)
class BadRequestFailure extends Failure {
  const BadRequestFailure([String message = 'Invalid request'])
      : super(message, code: 'BAD_REQUEST');
}

/// Validation failure (client-side validation)
class ValidationFailure extends Failure {
  const ValidationFailure([String message = 'Validation failed'])
      : super(message, code: 'VALIDATION_ERROR');
}

/// Cache failure (local storage errors)
class CacheFailure extends Failure {
  const CacheFailure([String message = 'Cache error occurred'])
      : super(message, code: 'CACHE_ERROR');
}

/// Timeout failure
class TimeoutFailure extends Failure {
  const TimeoutFailure([String message = 'Request timeout'])
      : super(message, code: 'TIMEOUT');
}

/// Parse failure (JSON parsing errors)
class ParseFailure extends Failure {
  const ParseFailure([String message = 'Failed to process data'])
      : super(message, code: 'PARSE_ERROR');
}

/// Unknown/Unexpected failure
class UnknownFailure extends Failure {
  const UnknownFailure([String message = 'An unexpected error occurred'])
      : super(message, code: 'UNKNOWN_ERROR');
}