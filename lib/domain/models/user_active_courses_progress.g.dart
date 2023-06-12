// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_active_courses_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserActiveCoursesProgress _$$_UserActiveCoursesProgressFromJson(
        Map<String, dynamic> json) =>
    _$_UserActiveCoursesProgress(
      activeCourses: (json['activeCourses'] as List<dynamic>)
          .map((e) => ActiveCourse.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentCourse:
          ActiveCourse.fromJson(json['currentCourse'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserActiveCoursesProgressToJson(
        _$_UserActiveCoursesProgress instance) =>
    <String, dynamic>{
      'activeCourses': instance.activeCourses,
      'currentCourse': instance.currentCourse,
    };
