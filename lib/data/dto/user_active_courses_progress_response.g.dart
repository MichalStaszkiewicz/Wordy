// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_active_courses_progress_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserActiveCoursesProgressResponse _$UserActiveCoursesProgressResponseFromJson(
        Map<String, dynamic> json) =>
    UserActiveCoursesProgressResponse(
      activeCourses: (json['activeCourses'] as List<dynamic>)
          .map((e) => ActiveCourseResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentCourse: ActiveCourseResponse.fromJson(
          json['currentCourse'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserActiveCoursesProgressResponseToJson(
        UserActiveCoursesProgressResponse instance) =>
    <String, dynamic>{
      'activeCourses': instance.activeCourses,
      'currentCourse': instance.currentCourse,
    };
