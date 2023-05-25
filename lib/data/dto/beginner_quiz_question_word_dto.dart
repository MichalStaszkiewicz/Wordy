import 'package:json_annotation/json_annotation.dart';

import '../../domain/models/beginner_quiz_question.dart';

part 'beginner_quiz_question_word_dto.g.dart';

@JsonSerializable()
class BeginnerQuizQuestionDto {
  BeginnerQuizQuestionDto({required this.answer, required this.question});
  String question;
  String answer;
  factory BeginnerQuizQuestionDto.fromJson(Map<String, dynamic> json) =>
      _$BeginnerQuizQuestionDtoFromJson(json);

  BeginnerQuizQuestion toDomain() {
    return BeginnerQuizQuestion(answer: answer, question: question);
  }
}
