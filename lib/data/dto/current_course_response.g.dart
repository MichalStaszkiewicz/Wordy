// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_course_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentCourseResponse _$CurrentCourseResponseFromJson(
        Map<String, dynamic> json) =>
    CurrentCourseResponse(
      message: json['message'] as String,
      userCourse: UserCourseResponse.fromJson(
          json['userCourse'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrentCourseResponseToJson(
        CurrentCourseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'userCourse': instance.userCourse,
    };
