import 'package:json_annotation/json_annotation.dart';

import '../../domain/models/achievement.dart';
part 'achievement_dto.g.dart';
@JsonSerializable()
class AchievementDto {
  AchievementDto(
      {required this.id,
      required this.name,
      required this.description,
      required this.goal});

  int id;
  String name;
  String description;
  int goal;
  Achievement toDomain() {
    return Achievement(
        id: id, name: name, description: description, goal: goal);
  }

  factory AchievementDto.fromJson(Map<String, dynamic> json) =>
      _$AchievementDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AchievementDtoToJson(this);
}
