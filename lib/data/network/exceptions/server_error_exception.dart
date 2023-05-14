class ServerErrorException implements Exception {
  final String message;
  final int statusCode;

  ServerErrorException(this.message, this.statusCode);

  @override
  String toString() {
    return 'ServerErrorException: $message, status code: $statusCode';
  }
}
