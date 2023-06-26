// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ActiveCourse _$$_ActiveCourseFromJson(Map<String, dynamic> json) =>
    _$_ActiveCourse(
      userCourse:
          UserCourse.fromJson(json['userCourse'] as Map<String, dynamic>),
      finishedTopics: json['finishedTopics'] as int,
      knownWords: json['knownWords'] as int,
      totalProgress: (json['totalProgress'] as num).toDouble(),
      topicsCount: json['topicsCount'] as int,
      topicProgress: (json['topicProgress'] as List<dynamic>)
          .map((e) => ProgressInTopic.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalWordsCount: json['totalWordsCount'] as int,
    );

Map<String, dynamic> _$$_ActiveCourseToJson(_$_ActiveCourse instance) =>
    <String, dynamic>{
      'userCourse': instance.userCourse,
      'finishedTopics': instance.finishedTopics,
      'knownWords': instance.knownWords,
      'totalProgress': instance.totalProgress,
      'topicsCount': instance.topicsCount,
      'topicProgress': instance.topicProgress,
      'totalWordsCount': instance.totalWordsCount,
    };
