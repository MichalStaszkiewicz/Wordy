import 'package:json_annotation/json_annotation.dart';

import '../../../domain/models/user_achievement.dart';

part 'achievement_list_response.g.dart';

@JsonSerializable()
class AchievementListResponse {
  AchievementListResponse({required this.achievements});
  List<UserAchievement> achievements;

  factory AchievementListResponse.fromJson(Map<String, dynamic> json) =>
      _$AchievementListResponseFromJson(json);
}
