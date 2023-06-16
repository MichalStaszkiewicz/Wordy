// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_achievement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserAchievement _$$_UserAchievementFromJson(Map<String, dynamic> json) =>
    _$_UserAchievement(
      progress: json['progress'] as int,
      achieved: json['achieved'] as bool,
      achievement:
          Achievement.fromJson(json['achievement'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserAchievementToJson(_$_UserAchievement instance) =>
    <String, dynamic>{
      'progress': instance.progress,
      'achieved': instance.achieved,
      'achievement': instance.achievement,
    };
