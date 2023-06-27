import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wordy/domain/models/active_course.dart';
import 'package:wordy/domain/models/course.dart';

import '../../data/network/response/language_list_response.dart';

part 'user_active_courses_progress.freezed.dart';
part 'user_active_courses_progress.g.dart';

@freezed
class UserActiveCoursesProgress with _$UserActiveCoursesProgress {
  factory UserActiveCoursesProgress({
    required List<ActiveCourse> activeCourses,
    required ActiveCourse currentCourse,
  }) = _UserActiveCoursesProgress;

  factory UserActiveCoursesProgress.fromJson(Map<String, dynamic> json) =>
      _$UserActiveCoursesProgressFromJson(json);
}
