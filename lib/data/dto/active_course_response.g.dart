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
    );

Map<String, dynamic> _$ActiveCourseResponseToJson(
        ActiveCourseResponse instance) =>
    <String, dynamic>{
      'userCourse': instance.userCourse,
      'finishedTopics': instance.finishedTopics,
      'wordsLearned': instance.wordsLearned,
      'totalProgress': instance.totalProgress,
      'topicsCount': instance.topicsCount,
    };
