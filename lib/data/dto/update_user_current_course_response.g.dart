// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_current_course_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserCurrentCourseResponse _$UpdateUserCurrentCourseResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateUserCurrentCourseResponse(
      message: json['message'] as String,
      updatedCourse: CourseResponse.fromJson(
          json['updatedCourse'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateUserCurrentCourseResponseToJson(
        UpdateUserCurrentCourseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'updatedCourse': instance.updatedCourse,
    };
