import 'package:json_annotation/json_annotation.dart';

part 'quiz_summary_request.g.dart';

@JsonSerializable()
class QuizSummary {
  QuizSummary({required this.token, required this.topic});

  String token;
  String topic;

  Map<String, dynamic> toJson() => _$QuizSummaryToJson(this);
}
