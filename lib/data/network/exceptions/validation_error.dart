class ValidationError implements Exception {
  ValidationError(this.title, {required this.message});
  String title = 'Validation Error';
  String message;
}
