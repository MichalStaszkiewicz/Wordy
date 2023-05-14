import 'package:json_annotation/json_annotation.dart';
import 'package:wordy/domain/models/word.dart';
part 'word_dto.g.dart';
@JsonSerializable()
class WordDto {
  WordDto(
      {required this.polish,
      required this.english,
      required this.french,
      required this.spanish,
      required this.topic});
  final String polish;
  final String english;
  final String french;
  final String spanish;
  final String topic;

  factory WordDto.fromJson(Map<String, dynamic> json) =>
      _$WordDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WordDtoToJson(this);
  Word toDomain() {
    return Word(
        polish: polish,
        english: english,
        french: french,
        spanish: spanish,
        topic: topic);
  }
}
