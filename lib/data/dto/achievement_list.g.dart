// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AchievementListResponse _$AchievementListResponseFromJson(
        Map<String, dynamic> json) =>
    AchievementListResponse(
      achievements: (json['achievements'] as List<dynamic>)
          .map((e) => AchievementDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AchievementListResponseToJson(
        AchievementListResponse instance) =>
    <String, dynamic>{
      'achievements': instance.achievements,
    };
