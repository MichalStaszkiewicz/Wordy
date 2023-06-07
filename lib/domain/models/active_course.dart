import 'package:wordy/domain/models/user_course.dart';

class ActiveCourse {
  ActiveCourse(
      {required this.userCourse,
      required this.finishedTopics,
      required this.wordsLearned,
      required this.totalProgress,
      required this.topicsCount});
  UserCourse userCourse;
  int finishedTopics;
  int wordsLearned;
  double totalProgress;
  int topicsCount;
}
