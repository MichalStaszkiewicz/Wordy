// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordDto _$WordDtoFromJson(Map<String, dynamic> json) => WordDto(
      polish: json['polish'] as String,
      english: json['english'] as String,
      french: json['french'] as String,
      spanish: json['spanish'] as String,
      topic: json['topic'] as String,
    );

Map<String, dynamic> _$WordDtoToJson(WordDto instance) => <String, dynamic>{
      'polish': instance.polish,
      'english': instance.english,
      'french': instance.french,
      'spanish': instance.spanish,
      'topic': instance.topic,
    };
