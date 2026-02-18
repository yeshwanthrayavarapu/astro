/// Base class for all application-specific exceptions.
sealed class AppException implements Exception {
  const AppException(this.message);
  final String message;

  @override
  String toString() => '$runtimeType: $message';
}

/// Thrown when a Firebase or network operation fails.
final class NetworkException extends AppException {
  const NetworkException(super.message);
}

/// Thrown when the user is not authenticated.
final class AuthException extends AppException {
  const AuthException(super.message);
}

/// Thrown when a requested resource is not found.
final class NotFoundException extends AppException {
  const NotFoundException(super.message);
}

/// Thrown when input validation fails.
final class ValidationException extends AppException {
  const ValidationException(super.message);
}
