// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beginner_quiz_word_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BeginnerQuizWordListResponse _$BeginnerQuizWordListResponseFromJson(
        Map<String, dynamic> json) =>
    BeginnerQuizWordListResponse(
      beginnerQuizWordList: (json['beginnerQuizWordList'] as List<dynamic>)
          .map((e) =>
              BeginnerQuizQuestionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BeginnerQuizWordListResponseToJson(
        BeginnerQuizWordListResponse instance) =>
    <String, dynamic>{
      'beginnerQuizWordList': instance.beginnerQuizWordList,
    };
