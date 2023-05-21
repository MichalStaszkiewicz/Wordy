import 'package:json_annotation/json_annotation.dart';

part 'update_user_current_course_request.g.dart';

@JsonSerializable()
class UpdateUserCurrentCourseRequest {
  UpdateUserCurrentCourseRequest(
      {required this.courseName, required this.userId});
  String userId;
  String courseName;

  Map<String, dynamic> toJson() => _$UpdateUserCurrentCourseRequestToJson(this);

  factory UpdateUserCurrentCourseRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserCurrentCourseRequestFromJson(json);
}
