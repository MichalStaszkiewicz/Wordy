// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) => ProfileData(
      finishedCourses: json['finishedCourses'] as int,
      learnedWords: json['learnedWords'] as int,
    );

Map<String, dynamic> _$ProfileDataToJson(ProfileData instance) =>
    <String, dynamic>{
      'finishedCourses': instance.finishedCourses,
      'learnedWords': instance.learnedWords,
    };
