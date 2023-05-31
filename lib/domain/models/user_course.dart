import 'package:wordy/domain/models/course.dart';

import 'interface_language.dart';

class UserCourse {
  UserCourse({required this.course, required this.interfaceLanguage});
  Course course;
  InterfaceLanguage interfaceLanguage;
}
