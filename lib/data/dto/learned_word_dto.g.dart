// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learned_word_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearnedWordDto _$LearnedWordDtoFromJson(Map<String, dynamic> json) =>
    LearnedWordDto(
      question: json['question'] as String,
      answer: json['answer'] as String,
      wordId: json['wordId'] as int,
    );

Map<String, dynamic> _$LearnedWordDtoToJson(LearnedWordDto instance) =>
    <String, dynamic>{
      'wordId': instance.wordId,
      'question': instance.question,
      'answer': instance.answer,
    };
