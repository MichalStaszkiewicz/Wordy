import 'package:json_annotation/json_annotation.dart';
import 'package:wordy/data/dto/interface_language_response.dart';
import 'package:wordy/data/dto/progress_in_topic_response.dart';
import 'package:wordy/data/dto/user_course_response.dart';
import 'package:wordy/domain/models/difficulty.dart';

import '../../domain/models/current_course_progress.dart';
import 'difficulty_response.dart';

part 'current_course_response.g.dart';

@JsonSerializable()
class CurrentCourseResponse {
  CurrentCourseResponse(
      {required this.userCourse,
     
      required this.finishedTopics,
      required this.wordsLearned,
      required this.totalProgress,
      required this.topicsCount,
      required this.topics});
  UserCourseResponse userCourse;

 
  int finishedTopics;
  int wordsLearned;
  double totalProgress;
  int topicsCount;
  List<ProgressInTopicResponse> topics;

  factory CurrentCourseResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrentCourseResponseFromJson(json);

  CurrentCourseProgress toDomain() {
    return CurrentCourseProgress(
        userCourse: userCourse.toDomain(),
    
        finishedTopics: finishedTopics,
        wordsLearned: wordsLearned,
        totalProgress: totalProgress,
        topicsCount: topicsCount,
        topics: topics.map((e) => e.toDomain()).toList());
  }
}
