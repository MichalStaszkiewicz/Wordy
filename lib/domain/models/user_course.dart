import 'package:wordy/domain/models/course.dart';
import 'package:wordy/domain/models/difficulty.dart';

import 'interface_language.dart';

class UserCourse {
  UserCourse(
      {required this.course,
      required this.interfaceLanguage,
      required this.difficulty});
  Course course;
  Difficulty difficulty;
  InterfaceLanguage interfaceLanguage;
}
