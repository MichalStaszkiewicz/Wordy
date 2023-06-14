import 'package:json_annotation/json_annotation.dart';
import 'package:wordy/domain/models/achievement.dart';

part 'achievement_list_response.g.dart';

@JsonSerializable()
class AchievementListResponse {
  AchievementListResponse({required this.achievements});
  List<Achievement> achievements;

  factory AchievementListResponse.fromJson(Map<String, dynamic> json) =>
      _$AchievementListResponseFromJson(json);
}
