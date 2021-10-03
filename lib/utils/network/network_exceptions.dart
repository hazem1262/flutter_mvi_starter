class UnAuthorizedException implements Exception {}

class ForbiddenException implements Exception {}

class FailureException implements Exception {
  FailureException(this.message) : super();

  final String message;
}

class ServerErrorException implements Exception {}
