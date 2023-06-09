import 'package:json_annotation/json_annotation.dart';
import 'package:wordy/data/dto/course_response.dart';

import '../../domain/models/user_active_courses_progress.dart';
import 'active_course_response.dart';

part 'user_active_courses_progress_response.g.dart';

@JsonSerializable()
class UserActiveCoursesProgressResponse {
  UserActiveCoursesProgressResponse({
    required this.activeCourses,
    required this.currentCourse,
  });
  List<ActiveCourseResponse> activeCourses;
  ActiveCourseResponse currentCourse;

  factory UserActiveCoursesProgressResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UserActiveCoursesProgressResponseFromJson(json);

  UserActiveCoursesProgress toDomain() {
    return UserActiveCoursesProgress(
      activeCourses: activeCourses.map((e) => e.toDomain()).toList(),
      currentCourse: currentCourse.toDomain(),
      availableCourses: [],
    );
  }
}
