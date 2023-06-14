// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Achievement _$$_AchievementFromJson(Map<String, dynamic> json) =>
    _$_Achievement(
      id: json['id'] as int?,
      goal: json['goal'] as int?,
      type: json['type'] as String?,
      description: json['description'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_AchievementToJson(_$_Achievement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'goal': instance.goal,
      'type': instance.type,
      'description': instance.description,
      'name': instance.name,
    };
