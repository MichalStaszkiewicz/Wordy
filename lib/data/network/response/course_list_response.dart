import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/models/course.dart';

part 'course_list_response.freezed.dart';
part 'course_list_response.g.dart';

@freezed
class CourseListResponse with _$CourseListResponse {
  const factory CourseListResponse({
    required List<Course> courses,
  }) = _CourseListResponse;

  factory CourseListResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseListResponseFromJson(json);
}
