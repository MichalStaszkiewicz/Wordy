class QuizQuestion {
  QuizQuestion(
      {required this.answer,
      required this.questionOptions,
      required this.question});
  final List<String> questionOptions;
  final String answer;
  final String question;
}
