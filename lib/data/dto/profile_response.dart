import 'package:json_annotation/json_annotation.dart';
import 'package:wordy/data/dto/user_course_response.dart';

import '../../domain/models/profile.dart';
part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  ProfileResponse(
      {required this.id, required this.fullName, required this.course});
  int id;
  String fullName;
  UserCourseResponse? course;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
  Profile toDomain() {
    return Profile(fullName: fullName, userCourse: course?.toDomain());
  }
}
