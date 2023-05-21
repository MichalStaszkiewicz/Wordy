// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_current_course_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserCurrentCourseRequest _$UpdateUserCurrentCourseRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateUserCurrentCourseRequest(
      courseName: json['courseName'] as String,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$UpdateUserCurrentCourseRequestToJson(
        UpdateUserCurrentCourseRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'courseName': instance.courseName,
    };
