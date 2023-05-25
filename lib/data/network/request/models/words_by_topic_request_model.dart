// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WordsByTopicModel {
  String topic;
  WordsByTopicModel({
    required this.topic,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'topic': topic,
    };
  }
}
