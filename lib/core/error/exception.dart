class StatusCodeException implements Exception {}

class ClientException implements Exception {
  final String errorMsg;

  ClientException(this.errorMsg);
}

class OffLineException implements Exception {}
