class InternalServerException implements Exception {
  final String message;

  InternalServerException(this.message);

  @override
  String toString() {
    return 'InternalServerErrorException: $message';
  }
}