import 'package:json_annotation/json_annotation.dart';
import 'package:wordy/data/dto/course_response.dart';
part 'course_list_response.g.dart';

@JsonSerializable()
class CourseListResponse {
  CourseListResponse({required this.courses});

  List<CourseResponse> courses;

  factory CourseListResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseListResponseFromJson(json);
}
