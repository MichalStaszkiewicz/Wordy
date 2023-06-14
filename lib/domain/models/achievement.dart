import 'package:freezed_annotation/freezed_annotation.dart';

part 'achievement.freezed.dart';
part 'achievement.g.dart';

@freezed
abstract class Achievement with _$Achievement {
  const factory Achievement({
    int? id,
    int? goal,
    String? type,
    String? description,
    String? name,
  }) = _Achievement;

  factory Achievement.fromJson(Map<String, dynamic> json) =>
      _$AchievementFromJson(json);
}
