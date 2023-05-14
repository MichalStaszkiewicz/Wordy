import 'package:json_annotation/json_annotation.dart';
import 'package:wordy/data/dto/word_dto.dart';
part 'word_list_response.g.dart';

@JsonSerializable()
class WordListResponse {
  WordListResponse({required this.wordList});

  List<WordDto> wordList;

  factory WordListResponse.fromJson(Map<String, dynamic> json) =>
      _$WordListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$WordListResponseToJson(this);
}
