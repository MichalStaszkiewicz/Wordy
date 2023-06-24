// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProfileData _$$_ProfileDataFromJson(Map<String, dynamic> json) =>
    _$_ProfileData(
      finishedCourses: json['finishedCourses'] as int,
      learnedWords: json['learnedWords'] as int,
      beginnerProgress: (json['beginnerProgress'] as List<dynamic>)
          .map((e) => ActiveCourse.fromJson(e as Map<String, dynamic>))
          .toList(),
      achievements: (json['achievements'] as List<dynamic>)
          .map((e) => UserAchievement.fromJson(e as Map<String, dynamic>))
          .toList(),
      hotStreak: json['hotStreak'] as int,
      fullName: json['fullName'] as String,
    );

Map<String, dynamic> _$$_ProfileDataToJson(_$_ProfileData instance) =>
    <String, dynamic>{
      'finishedCourses': instance.finishedCourses,
      'learnedWords': instance.learnedWords,
      'beginnerProgress': instance.beginnerProgress,
      'achievements': instance.achievements,
      'hotStreak': instance.hotStreak,
      'fullName': instance.fullName,
    };
