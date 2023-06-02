import 'package:json_annotation/json_annotation.dart';
import 'package:wordy/data/dto/user_course_response.dart';

import '../../domain/models/course.dart';
import '../../domain/models/user_course.dart';
import 'course_response.dart';

part 'update_user_current_course_response.g.dart';

@JsonSerializable()
class UpdateUserCurrentCourseResponse {
  UpdateUserCurrentCourseResponse(
      {required this.message, required this.updatedCourse});
  String message;
  UserCourseResponse updatedCourse;

  factory UpdateUserCurrentCourseResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserCurrentCourseResponseFromJson(json);

  UserCourse toDomain() {
    return UserCourse(
        course: updatedCourse.course.toDomain(),
        interfaceLanguage: updatedCourse.interfaceLanguage.toDomain());
  }
}
