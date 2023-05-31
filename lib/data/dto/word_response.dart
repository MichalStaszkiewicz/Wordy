import 'package:json_annotation/json_annotation.dart';
import 'package:wordy/data/dto/topic_response.dart';
import 'package:wordy/domain/models/word.dart';
part 'word_response.g.dart';

@JsonSerializable()
class WordResponse {
  WordResponse({
    required this.polish,
    required this.english,
    required this.french,
    required this.spanish,
  });
  final String polish;
  final String english;
  final String french;
  final String spanish;

  factory WordResponse.fromJson(Map<String, dynamic> json) =>
      _$WordResponseFromJson(json);
  Map<String, dynamic> toJson() => _$WordResponseToJson(this);
  Word toDomain() {
    return Word(
      polish: polish,
      english: english,
      french: french,
      spanish: spanish,
    );
  }
}
