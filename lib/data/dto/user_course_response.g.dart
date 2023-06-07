// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_course_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCourseResponse _$UserCourseResponseFromJson(Map<String, dynamic> json) =>
    UserCourseResponse(
      id: json['id'] as int,
      course: CourseResponse.fromJson(json['course'] as Map<String, dynamic>),
      interfaceLanguage: InterfaceLanguageResponse.fromJson(
          json['interfaceLanguage'] as Map<String, dynamic>),
      difficulty: DifficultyResponse.fromJson(
          json['difficulty'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserCourseResponseToJson(UserCourseResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course': instance.course,
      'interfaceLanguage': instance.interfaceLanguage,
      'difficulty': instance.difficulty,
    };
