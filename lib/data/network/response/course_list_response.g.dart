// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CourseListResponse _$$_CourseListResponseFromJson(
        Map<String, dynamic> json) =>
    _$_CourseListResponse(
      courses: (json['courses'] as List<dynamic>)
          .map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CourseListResponseToJson(
        _$_CourseListResponse instance) =>
    <String, dynamic>{
      'courses': instance.courses,
    };
