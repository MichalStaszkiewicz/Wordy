import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wordy/domain/models/progress_in_topic.dart';
import 'package:wordy/domain/models/user_course.dart';

part 'active_course.freezed.dart';
part 'active_course.g.dart';

@freezed
class ActiveCourse with _$ActiveCourse {
  factory ActiveCourse({
    required UserCourse userCourse,
    required int finishedTopics,
    required int wordsLearned,
    required double totalProgress,
    required int topicsCount,
    required List<ProgressInTopic> topicProgress,
    required int totalWordsCount,
  }) = _ActiveCourse;

  factory ActiveCourse.fromJson(Map<String, dynamic> json) =>
      _$ActiveCourseFromJson(json['activeCourse']);
}
