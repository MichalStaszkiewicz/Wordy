


import '../../domain/models/quiz_question.dart';

class QuizQuestionDto {
  QuizQuestionDto(
      {required this.answer,
      required this.questionOptions,
      required this.question,
      required this.correct_answer_index});
  final List<String> questionOptions;
  final String answer;
  final String question;
  final int correct_answer_index;


QuizQuestion toDomain(){


return QuizQuestion(answer: answer, questionOptions: questionOptions, question: question, correct_answer_index: correct_answer_index);

}

}
