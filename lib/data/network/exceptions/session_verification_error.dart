class SessionVerificationError implements Exception {
  final String message;
  final String title;

  SessionVerificationError({required this.title, required this.message});
}
