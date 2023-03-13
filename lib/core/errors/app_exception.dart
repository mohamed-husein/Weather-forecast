class AppException implements Exception {
  final String? message;

  AppException(
    this.message,
  );

  @override
  String toString() {
    return "$message";
  }
}

class NoContentException extends AppException {
  NoContentException(super.message);
}

class BadRequestException extends AppException {
  BadRequestException(super.message);
}

class UnauthorizedException extends AppException {
  UnauthorizedException(super.message);
}

class ForbiddenException extends AppException {
  ForbiddenException(super.message);
}

class InternetServerErrorException extends AppException {
  InternetServerErrorException(super.message);
}

class NotFoundException extends AppException {
  NotFoundException(super.message);
}

class UnknownErrorException extends AppException {
  UnknownErrorException(super.message);
}
