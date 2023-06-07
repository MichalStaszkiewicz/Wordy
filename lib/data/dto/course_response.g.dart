// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseResponse _$CourseResponseFromJson(Map<String, dynamic> json) =>
    CourseResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
      circularImage: json['circularImage'] as String,
    );

Map<String, dynamic> _$CourseResponseToJson(CourseResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'circularImage': instance.circularImage,
    };
