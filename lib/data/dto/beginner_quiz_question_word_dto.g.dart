// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beginner_quiz_question_word_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BeginnerQuizQuestionDto _$BeginnerQuizQuestionDtoFromJson(
        Map<String, dynamic> json) =>
    BeginnerQuizQuestionDto(
      answer: json['answer'] as String,
      question: json['question'] as String,
      wordId: json['wordId'] as int,
    );

Map<String, dynamic> _$BeginnerQuizQuestionDtoToJson(
        BeginnerQuizQuestionDto instance) =>
    <String, dynamic>{
      'wordId': instance.wordId,
      'question': instance.question,
      'answer': instance.answer,
    };
