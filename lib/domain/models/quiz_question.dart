class QuizQuestion {
  QuizQuestion(
      {required this.answer,
      required this.questionOptions,
      required this.question,
      required this.correctAnswerIndex});
  final List<String> questionOptions;
  final String answer;
  final String question;
  final int correctAnswerIndex;
}
