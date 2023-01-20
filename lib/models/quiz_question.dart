class QuizQuestion {
  QuizQuestion(
      {required this.answer,
      required this.questionOptions,
      required this.question,
      required this.correct_answer_index});
  final List<String> questionOptions;
  final String answer;
  final String question;
  final int correct_answer_index;
}
