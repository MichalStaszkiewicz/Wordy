// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'difficulty_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DifficultyResponse _$DifficultyResponseFromJson(Map<String, dynamic> json) =>
    DifficultyResponse(
      beginner:
          BeginnerResponse.fromJson(json['beginner'] as Map<String, dynamic>),
      id: json['id'] as int,
    );

Map<String, dynamic> _$DifficultyResponseToJson(DifficultyResponse instance) =>
    <String, dynamic>{
      'beginner': instance.beginner,
      'id': instance.id,
    };
