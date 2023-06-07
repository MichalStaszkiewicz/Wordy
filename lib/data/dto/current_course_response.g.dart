// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_course_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentCourseResponse _$CurrentCourseResponseFromJson(
        Map<String, dynamic> json) =>
    CurrentCourseResponse(
      userCourse: UserCourseResponse.fromJson(
          json['userCourse'] as Map<String, dynamic>),
      finishedTopics: json['finishedTopics'] as int,
      wordsLearned: json['wordsLearned'] as int,
      totalProgress: (json['totalProgress'] as num).toDouble(),
      topicsCount: json['topicsCount'] as int,
      topics: (json['topics'] as List<dynamic>)
          .map((e) =>
              ProgressInTopicResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CurrentCourseResponseToJson(
        CurrentCourseResponse instance) =>
    <String, dynamic>{
      'userCourse': instance.userCourse,
      'finishedTopics': instance.finishedTopics,
      'wordsLearned': instance.wordsLearned,
      'totalProgress': instance.totalProgress,
      'topicsCount': instance.topicsCount,
      'topics': instance.topics,
    };
