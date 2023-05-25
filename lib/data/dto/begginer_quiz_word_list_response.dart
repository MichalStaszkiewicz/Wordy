import 'package:json_annotation/json_annotation.dart';

import 'begginer_quiz_question_word_dto.dart';

part 'begginer_quiz_word_list_response.g.dart';

@JsonSerializable()
class BegginerQuizWordListResponse {
  BegginerQuizWordListResponse({required this.begginerQuizWordList});
  List<BegginerQuizQuestionWordDto> begginerQuizWordList;

  factory BegginerQuizWordListResponse.fromJson(Map<String, dynamic> json) =>
      _$BegginerQuizWordListResponseFromJson(json);
}
