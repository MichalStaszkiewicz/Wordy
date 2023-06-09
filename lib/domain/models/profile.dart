import 'package:wordy/domain/models/user_course.dart';


class Profile {
  Profile({required this.fullName, required this.userCourse});
  String fullName;
  UserCourse? userCourse;
}
