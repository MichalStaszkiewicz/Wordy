// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_in_topic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProgressInTopic _$$_ProgressInTopicFromJson(Map<String, dynamic> json) =>
    _$_ProgressInTopic(
      name: json['name'] as String,
      knownWords: json['knownWords'] as int,
      wordsCount: json['wordsCount'] as int,
      topic: Topic.fromJson(json['topic'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ProgressInTopicToJson(_$_ProgressInTopic instance) =>
    <String, dynamic>{
      'name': instance.name,
      'knownWords': instance.knownWords,
      'wordsCount': instance.wordsCount,
      'topic': instance.topic,
    };
