import 'package:wordy/domain/models/active_course.dart';

import 'current_course_progress.dart';

class UserActiveCoursesProgress {
  UserActiveCoursesProgress(
      {required this.activeCourses, required this.currentCourse});
  List<ActiveCourse> activeCourses;
  CurrentCourseProgress currentCourse;
}
