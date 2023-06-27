import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wordy/domain/models/topic.dart';

part 'progress_in_topic.freezed.dart';
part 'progress_in_topic.g.dart';

@freezed
class ProgressInTopic with _$ProgressInTopic {
  factory ProgressInTopic({
    required String name,
    required int knownWords,
    required int wordsCount,
    required Topic topic,
  }) = _ProgressInTopic;

  factory ProgressInTopic.fromJson(Map<String, dynamic> json) =>
      _$ProgressInTopicFromJson(json);
}
