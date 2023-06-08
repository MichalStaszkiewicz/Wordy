import 'package:wordy/domain/models/active_course.dart';

class UserActiveCoursesProgress {
  UserActiveCoursesProgress(
      {required this.activeCourses, required this.currentCourse});
  List<ActiveCourse> activeCourses;
  ActiveCourse currentCourse;
}
