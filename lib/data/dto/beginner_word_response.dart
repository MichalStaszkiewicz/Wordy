import 'package:json_annotation/json_annotation.dart';
import 'package:wordy/data/dto/word_response.dart';

import 'beginner_response.dart';

part 'beginner_word_response.g.dart';

@JsonSerializable()
class BeginnerWordResponse {
  BeginnerWordResponse(
      {required this.id, required this.word, required this.beginnerCourse});
  int id;
  WordResponse word;
  BeginnerResponse beginnerCourse;
}
