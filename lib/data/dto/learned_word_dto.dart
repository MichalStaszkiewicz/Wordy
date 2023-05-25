import 'package:json_annotation/json_annotation.dart';

import '../../domain/models/learned_word.dart';
part 'learned_word_dto.g.dart';

@JsonSerializable()
class LearnedWordDto {
  LearnedWordDto({required this.question, required this.answer});
  String question;
  String answer;

  factory LearnedWordDto.fromJson(Map<String, dynamic> json) =>
      _$LearnedWordDtoFromJson(json);

  LearnedWord toDomain() {
    return LearnedWord(question: question, answer: answer);
  }
}
