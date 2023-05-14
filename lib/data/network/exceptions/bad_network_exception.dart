class BadNetworkException implements Exception {
  final String message;

  BadNetworkException(this.message);

  @override
  String toString() {
    return 'BadNetworkException: $message';
  }
}
