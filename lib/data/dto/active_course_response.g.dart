// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_course_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveCourseResponse _$ActiveCourseResponseFromJson(
        Map<String, dynamic> json) =>
    ActiveCourseResponse(
      userCourse: UserCourseResponse.fromJson(
          json['userCourse'] as Map<String, dynamic>),
      finishedTopics: json['finishedTopics'] as int,
      wordsLearned: json['wordsLearned'] as int,
      totalProgress: (json['totalProgress'] as num).toDouble(),
      topicsCount: json['topicsCount'] as int,
      topicProgress: (json['topicProgress'] as List<dynamic>)
          .map((e) =>
              ProgressInTopicResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ActiveCourseResponseToJson(
        ActiveCourseResponse instance) =>
    <String, dynamic>{
      'userCourse': instance.userCourse,
      'topicProgress': instance.topicProgress,
      'finishedTopics': instance.finishedTopics,
      'wordsLearned': instance.wordsLearned,
      'totalProgress': instance.totalProgress,
      'topicsCount': instance.topicsCount,
    };