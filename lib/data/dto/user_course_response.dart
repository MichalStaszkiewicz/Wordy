import 'package:json_annotation/json_annotation.dart';
import 'package:wordy/data/dto/interface_language_response.dart';

import '../../domain/models/user_course.dart';
import 'course_response.dart';

part 'user_course_response.g.dart';

@JsonSerializable()
class UserCourseResponse {
  UserCourseResponse(
      {required this.id,
      required this.course,
      required this.interfaceLanguage});
  int id;
  CourseResponse course;
  InterfaceLanguageResponse interfaceLanguage;

  factory UserCourseResponse.fromJson(Map<String, dynamic> json) =>
      _$UserCourseResponseFromJson(json);

  UserCourse toDomain() {
    return UserCourse(
      course: course.toDomain(),
      interfaceLanguage: interfaceLanguage.toDomain(),
    );
  }
}
