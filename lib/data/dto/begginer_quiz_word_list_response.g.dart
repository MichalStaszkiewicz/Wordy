// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'begginer_quiz_word_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BegginerQuizWordListResponse _$BegginerQuizWordListResponseFromJson(
        Map<String, dynamic> json) =>
    BegginerQuizWordListResponse(
      begginerQuizWordList: (json['begginerQuizWordList'] as List<dynamic>)
          .map((e) =>
              BegginerQuizQuestionWordDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BegginerQuizWordListResponseToJson(
        BegginerQuizWordListResponse instance) =>
    <String, dynamic>{
      'begginerQuizWordList': instance.begginerQuizWordList,
    };
