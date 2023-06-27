import 'package:json_annotation/json_annotation.dart';

part 'topic.g.dart';

@JsonSerializable()
class Topic {
  Topic({
    required this.name,
    required this.image
  });

  String name;
  String image;

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);
}
