import 'package:json_annotation/json_annotation.dart';

import '../../domain/models/course.dart';
part 'course_response.g.dart';

@JsonSerializable()
class CourseResponse {
  CourseResponse(
      {required this.id,
      required this.name,
      required this.image,
      required this.circularImage});
  int id;
  String name;
  String image;
  String circularImage;
  factory CourseResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseResponseFromJson(json);

  Course toDomain() {
    return Course(name: name, image: image, circularImage: circularImage);
  }
}
