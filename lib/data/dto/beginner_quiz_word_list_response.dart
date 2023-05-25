import 'package:json_annotation/json_annotation.dart';

import 'beginner_quiz_question_word_dto.dart';

part 'beginner_quiz_word_list_response.g.dart';

@JsonSerializable()
class BeginnerQuizWordListResponse {
  BeginnerQuizWordListResponse({required this.beginnerQuizWordList});
  List<BeginnerQuizQuestionDto> beginnerQuizWordList;

  factory BeginnerQuizWordListResponse.fromJson(Map<String, dynamic> json) =>
      _$BeginnerQuizWordListResponseFromJson(json);
}
