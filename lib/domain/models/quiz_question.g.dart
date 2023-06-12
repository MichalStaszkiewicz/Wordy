// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuizQuestion _$$_QuizQuestionFromJson(Map<String, dynamic> json) =>
    _$_QuizQuestion(
      questionOptions: (json['questionOptions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      answer: json['answer'] as String,
      question: json['question'] as String,
      correctAnswerIndex: json['correctAnswerIndex'] as int,
    );

Map<String, dynamic> _$$_QuizQuestionToJson(_$_QuizQuestion instance) =>
    <String, dynamic>{
      'questionOptions': instance.questionOptions,
      'answer': instance.answer,
      'question': instance.question,
      'correctAnswerIndex': instance.correctAnswerIndex,
    };
