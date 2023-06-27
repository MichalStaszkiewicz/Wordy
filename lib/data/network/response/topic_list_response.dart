import '../../../domain/models/topic.dart';
import 'package:json_annotation/json_annotation.dart';
part 'topic_list_response.g.dart';

@JsonSerializable()
class TopicListResponse {
  List<Topic> topics;
  TopicListResponse({required this.topics});
  factory TopicListResponse.fromJson(Map<String, dynamic> json) =>
      _$TopicListResponseFromJson(json);
}
