class ServerException implements Exception {}

class OfflineException implements Exception {}

class FailException implements Exception {
  final String failMsg;
  FailException(this.failMsg);
}
