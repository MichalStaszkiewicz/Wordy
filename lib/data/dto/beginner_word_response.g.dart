// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beginner_word_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BeginnerWordResponse _$BeginnerWordResponseFromJson(
        Map<String, dynamic> json) =>
    BeginnerWordResponse(
      id: json['id'] as int,
      word: WordResponse.fromJson(json['word'] as Map<String, dynamic>),
      beginnerCourse: BeginnerResponse.fromJson(
          json['beginnerCourse'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BeginnerWordResponseToJson(
        BeginnerWordResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'word': instance.word,
      'beginnerCourse': instance.beginnerCourse,
    };
