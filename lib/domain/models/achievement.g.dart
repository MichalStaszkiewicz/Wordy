// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Achievement _$$_AchievementFromJson(Map<String, dynamic> json) =>
    _$_Achievement(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      goal: json['goal'] as int,
      progress: json['progress'] as int?,
    );

Map<String, dynamic> _$$_AchievementToJson(_$_Achievement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'goal': instance.goal,
      'progress': instance.progress,
    };
