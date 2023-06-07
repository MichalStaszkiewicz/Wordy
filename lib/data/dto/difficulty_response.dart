import 'package:json_annotation/json_annotation.dart';
import 'package:wordy/domain/models/difficulty.dart';

import 'beginner_response.dart';
part 'difficulty_response.g.dart';

@JsonSerializable()
class DifficultyResponse {
  DifficultyResponse({required this.beginner, required this.id});

  BeginnerResponse beginner;
  int id;

  factory DifficultyResponse.fromJson(Map<String, dynamic> json) =>
      _$DifficultyResponseFromJson(json);

  Difficulty toDomain() {
    return Difficulty(beginner: beginner.toDomain());
  }
}
