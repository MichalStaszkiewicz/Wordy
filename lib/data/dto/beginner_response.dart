import 'package:json_annotation/json_annotation.dart';
import 'package:wordy/data/dto/user_course_response.dart';

part 'beginner_response.g.dart';

@JsonSerializable()
class BeginnerResponse {
  BeginnerResponse({required this.id, required this.userCourse});
  int id;
  UserCourseResponse userCourse;
  factory BeginnerResponse.fromJson(Map<String, dynamic> json) =>
      _$BeginnerResponseFromJson(json);
}
