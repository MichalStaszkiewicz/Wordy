import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wordy/domain/models/course.dart';
import 'package:wordy/domain/models/difficulty.dart';
import 'package:wordy/domain/models/interface_language.dart';

part 'user_course.freezed.dart';
part 'user_course.g.dart';

@freezed
class UserCourse with _$UserCourse {
  factory UserCourse({
    required Course course,
    required Difficulty difficulty,
    required InterfaceLanguage interfaceLanguage,
  }) = _UserCourse;

  factory UserCourse.fromJson(Map<String, dynamic> json) =>
      _$UserCourseFromJson(json);
}
