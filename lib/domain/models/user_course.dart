import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wordy/domain/models/course.dart';
import 'package:wordy/domain/models/mode.dart';
import 'package:wordy/domain/models/interface_language.dart';
import 'package:wordy/domain/models/topic.dart';

part 'user_course.freezed.dart';
part 'user_course.g.dart';

@freezed
class UserCourse with _$UserCourse {
  factory UserCourse({
    required Course course,
    required Mode mode,
    required InterfaceLanguage interfaceLanguage,
    Topic? lastTopic,
  }) = _UserCourse;

  factory UserCourse.fromJson(Map<String, dynamic> json) =>
      _$UserCourseFromJson(json);
}
