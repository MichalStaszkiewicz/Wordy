import 'package:wordy/domain/models/active_course.dart';

import 'course.dart';

class UserActiveCoursesProgress {
  UserActiveCoursesProgress(
      {required this.activeCourses,
      required this.currentCourse,
      required this.availableCourses});
  List<ActiveCourse> activeCourses;
  List<Course> availableCourses;
  ActiveCourse currentCourse;
}
