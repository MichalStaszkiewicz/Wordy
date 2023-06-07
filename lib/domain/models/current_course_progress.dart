import 'package:wordy/domain/models/progress_in_topic.dart';
import 'package:wordy/domain/models/user_course.dart';

import 'difficulty.dart';
import 'interface_language.dart';

class CurrentCourseProgress {
  CurrentCourseProgress(
      {required this.userCourse,
      required this.finishedTopics,
      required this.wordsLearned,
      required this.totalProgress,
      required this.topicsCount,
      required this.topics});
  UserCourse userCourse;

  int finishedTopics;
  int wordsLearned;
  double totalProgress;
  int topicsCount;
  List<ProgressInTopic> topics;
}
