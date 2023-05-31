// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopicResponse _$TopicResponseFromJson(Map<String, dynamic> json) =>
    TopicResponse(
      id: json['id'] as int,
      course: CourseResponse.fromJson(json['course'] as Map<String, dynamic>),
      name: json['name'] as String,
    );

Map<String, dynamic> _$TopicResponseToJson(TopicResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'course': instance.course,
    };
