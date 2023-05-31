import 'package:json_annotation/json_annotation.dart';
import 'package:wordy/data/dto/course_response.dart';

import '../../domain/models/topic.dart';

part 'topic_response.g.dart';

@JsonSerializable()
class TopicResponse {
  TopicResponse({required this.id, required this.course, required this.name});
  int id;
  String name;
  CourseResponse course;

  factory TopicResponse.fromJson(Map<String, dynamic> json) =>
      _$TopicResponseFromJson(json);
  Topic toDomain() {
    return Topic(name: name);
  }
}
