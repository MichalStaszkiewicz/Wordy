class ValidationError implements Exception {
  ValidationError(this.title, {required this.message, required this.type});
  String title = 'Validation Error';
  String message;
  ValidationErrorType type;
}

enum ValidationErrorType {
  fill_fields,
  bad_email_format,
  short_password,
}
