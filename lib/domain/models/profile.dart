import 'package:wordy/domain/models/user_course.dart';

import 'course.dart';

class Profile {
  Profile({required this.fullName, required this.course});
  String fullName;
  UserCourse? course;
}
