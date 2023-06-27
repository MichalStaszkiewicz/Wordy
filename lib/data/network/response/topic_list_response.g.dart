// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopicListResponse _$TopicListResponseFromJson(Map<String, dynamic> json) =>
    TopicListResponse(
      topics: (json['topics'] as List<dynamic>)
          .map((e) => Topic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TopicListResponseToJson(TopicListResponse instance) =>
    <String, dynamic>{
      'topics': instance.topics,
    };
