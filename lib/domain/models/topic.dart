import 'package:json_annotation/json_annotation.dart';

part 'topic.g.dart';

@JsonSerializable()
class Topic {
  Topic({
    required this.name,
  });

  String name;

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);
}
