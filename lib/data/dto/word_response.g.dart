// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordResponse _$WordResponseFromJson(Map<String, dynamic> json) => WordResponse(
      polish: json['polish'] as String,
      english: json['english'] as String,
      french: json['french'] as String,
      spanish: json['spanish'] as String,
      id: json['id'] as int,
      topic: TopicResponse.fromJson(json['topic'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WordResponseToJson(WordResponse instance) =>
    <String, dynamic>{
      'polish': instance.polish,
      'english': instance.english,
      'french': instance.french,
      'spanish': instance.spanish,
      'id': instance.id,
      'topic': instance.topic,
    };
