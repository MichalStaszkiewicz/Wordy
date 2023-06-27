import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wordy/domain/models/achievement.dart';

part 'user_achievement.freezed.dart';
part 'user_achievement.g.dart';

@freezed
class UserAchievement with _$UserAchievement {
  factory UserAchievement(
      {required int progress,
      required bool achieved,
      required Achievement achievement}) = _UserAchievement;

  factory UserAchievement.fromJson(Map<String, dynamic> json) =>
      _$UserAchievementFromJson(json);
}
