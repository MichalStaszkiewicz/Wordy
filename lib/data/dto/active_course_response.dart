import 'package:json_annotation/json_annotation.dart';
import 'package:wordy/data/dto/user_course_response.dart';

import '../../domain/models/active_course.dart';

part 'active_course_response.g.dart';

@JsonSerializable()
class ActiveCourseResponse {
  ActiveCourseResponse(
      {required this.userCourse,
      required this.finishedTopics,
      required this.wordsLearned,
      required this.totalProgress,
      required this.topicsCount});
  UserCourseResponse userCourse;
  int finishedTopics;
  int wordsLearned;
  double totalProgress;
  int topicsCount;

  factory ActiveCourseResponse.fromJson(Map<String, dynamic> json) =>
      _$ActiveCourseResponseFromJson(json['activeCourse']);
  ActiveCourse toDomain() {
    return ActiveCourse(
        userCourse: userCourse.toDomain(),
        finishedTopics: finishedTopics,
        wordsLearned: wordsLearned,
        totalProgress: totalProgress,
        topicsCount: topicsCount);
  }
}
