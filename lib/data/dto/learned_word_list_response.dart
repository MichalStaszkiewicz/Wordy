import 'package:json_annotation/json_annotation.dart';

import 'learned_word_dto.dart';
part 'learned_word_list_response.g.dart';

@JsonSerializable()
class LearnedWordListResponse {
  LearnedWordListResponse({required this.learnedWords});
  List<LearnedWordDto> learnedWords;

  factory LearnedWordListResponse.fromJson(Map<String, dynamic> json) =>
      _$LearnedWordListResponseFromJson(json);
}
