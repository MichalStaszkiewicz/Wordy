// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'begginer_quiz_question_word_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BegginerQuizQuestionWordDto _$BegginerQuizQuestionWordDtoFromJson(
        Map<String, dynamic> json) =>
    BegginerQuizQuestionWordDto(
      answer: json['answer'] as String,
      question: json['question'] as String,
    );

Map<String, dynamic> _$BegginerQuizQuestionWordDtoToJson(
        BegginerQuizQuestionWordDto instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answer': instance.answer,
    };
