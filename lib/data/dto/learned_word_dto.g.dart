// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learned_word_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearnedWordDto _$LearnedWordDtoFromJson(Map<String, dynamic> json) =>
    LearnedWordDto(
      question: json['question'] as String,
      answer: json['answer'] as String,
    );

Map<String, dynamic> _$LearnedWordDtoToJson(LearnedWordDto instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answer': instance.answer,
    };
