import 'package:freezed_annotation/freezed_annotation.dart';
import 'beginner.dart';

part 'difficulty.freezed.dart';
part 'difficulty.g.dart';

@freezed
class Difficulty with _$Difficulty {
  factory Difficulty({required Beginner beginner}) = _Difficulty;
  factory Difficulty.fromJson(Map<String, dynamic> json) =>
      _$DifficultyFromJson(json);
}
