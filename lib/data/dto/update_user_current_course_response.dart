import 'package:json_annotation/json_annotation.dart';

part 'update_user_current_course_response.g.dart';

@JsonSerializable()
class UpdateUserCurrentCourseResponse {
  UpdateUserCurrentCourseResponse(
      {required this.message, required this.updatedCourse});
  String message;
  String updatedCourse;

  factory UpdateUserCurrentCourseResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserCurrentCourseResponseFromJson(json);
}
