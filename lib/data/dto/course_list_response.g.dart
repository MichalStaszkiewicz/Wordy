// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseListResponse _$CourseListResponseFromJson(Map<String, dynamic> json) =>
    CourseListResponse(
      courses: (json['courses'] as List<dynamic>)
          .map((e) => CourseResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseListResponseToJson(CourseListResponse instance) =>
    <String, dynamic>{
      'courses': instance.courses,
    };
