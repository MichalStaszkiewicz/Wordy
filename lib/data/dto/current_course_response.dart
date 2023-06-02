import 'package:json_annotation/json_annotation.dart';
import 'package:wordy/data/dto/user_course_response.dart';

part 'current_course_response.g.dart';

@JsonSerializable()
class CurrentCourseResponse {
  CurrentCourseResponse({required this.message, required this.userCourse});
  String message;
  UserCourseResponse userCourse;

  factory CurrentCourseResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrentCourseResponseFromJson(json);

      
}
