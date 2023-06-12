import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_question.freezed.dart';
part 'quiz_question.g.dart';

@freezed
class QuizQuestion with _$QuizQuestion {
  factory QuizQuestion({
    required List<String> questionOptions,
    required String answer,
    required String question,
    required int correctAnswerIndex,
  }) = _QuizQuestion;

  factory QuizQuestion.fromJson(Map<String, dynamic> json) =>
      _$QuizQuestionFromJson(json);
}
