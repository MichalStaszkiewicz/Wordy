import 'package:json_annotation/json_annotation.dart';

import 'achievement_dto.dart';

part 'achievement_list.g.dart';

@JsonSerializable()
class AchievementListResponse {
  AchievementListResponse({required this.achievements});
  List<AchievementDto> achievements;
  factory AchievementListResponse.fromJson(Map<String, dynamic> json) =>
      _$AchievementListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AchievementListResponseToJson(this);
}
