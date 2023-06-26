// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserCourse _$$_UserCourseFromJson(Map<String, dynamic> json) =>
    _$_UserCourse(
      course: Course.fromJson(json['course'] as Map<String, dynamic>),
      mode: Mode.fromJson(json['mode'] as Map<String, dynamic>),
      interfaceLanguage: InterfaceLanguage.fromJson(
          json['interfaceLanguage'] as Map<String, dynamic>),
      lastTopic: json['lastTopic'] == null
          ? null
          : Topic.fromJson(json['lastTopic'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserCourseToJson(_$_UserCourse instance) =>
    <String, dynamic>{
      'course': instance.course,
      'mode': instance.mode,
      'interfaceLanguage': instance.interfaceLanguage,
      'lastTopic': instance.lastTopic,
    };
