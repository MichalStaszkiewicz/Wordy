// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beginner_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BeginnerResponse _$BeginnerResponseFromJson(Map<String, dynamic> json) =>
    BeginnerResponse(
      id: json['id'] as int,
      userCourse: UserCourseResponse.fromJson(
          json['userCourse'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BeginnerResponseToJson(BeginnerResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userCourse': instance.userCourse,
    };
