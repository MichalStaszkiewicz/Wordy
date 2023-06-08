import 'package:json_annotation/json_annotation.dart';

import '../../domain/models/progress_in_topic.dart';
part 'progress_in_topic_response.g.dart';

@JsonSerializable()
class ProgressInTopicResponse {
  ProgressInTopicResponse(
      {required this.knownWords, required this.name, required this.wordsCount});
  String name;
  int knownWords;
  int wordsCount;

  factory ProgressInTopicResponse.fromJson(Map<String, dynamic> json) =>
      _$ProgressInTopicResponseFromJson(json);

  ProgressInTopic toDomain() {
    return ProgressInTopic(
        name: name, knownWords: knownWords, wordsCount: wordsCount);
  }
}
