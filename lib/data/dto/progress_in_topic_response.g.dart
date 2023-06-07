// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_in_topic_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgressInTopicResponse _$ProgressInTopicResponseFromJson(
        Map<String, dynamic> json) =>
    ProgressInTopicResponse(
      knownWords: json['knownWords'] as int,
      name: json['name'] as String,
      wordsCount: json['wordsCount'] as int,
    );

Map<String, dynamic> _$ProgressInTopicResponseToJson(
        ProgressInTopicResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'knownWords': instance.knownWords,
      'wordsCount': instance.wordsCount,
    };
