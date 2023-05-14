// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AchievementDto _$AchievementDtoFromJson(Map<String, dynamic> json) =>
    AchievementDto(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      goal: json['goal'] as int,
    );

Map<String, dynamic> _$AchievementDtoToJson(AchievementDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'goal': instance.goal,
    };
