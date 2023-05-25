import 'package:json_annotation/json_annotation.dart';

import '../../domain/models/begginer_quiz_question.dart';

part 'begginer_quiz_question_word_dto.g.dart';

@JsonSerializable()
class BegginerQuizQuestionWordDto {
  BegginerQuizQuestionWordDto({required this.answer, required this.question});
  String question;
  String answer;
  factory BegginerQuizQuestionWordDto.fromJson(Map<String, dynamic> json) =>
      _$BegginerQuizQuestionWordDtoFromJson(json);

  BegginerQuizQuestionWord toDomain() {
    return BegginerQuizQuestionWord(answer: answer, question: question);
  }
}
