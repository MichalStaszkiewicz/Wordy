class ApiErrorMessageException implements Exception{
  ApiErrorMessageException({required this.errorMessage});
  final String errorMessage;
  @override 
  String toString() {
    return 'ApiErrorMessageException: $errorMessage';
  }
}
