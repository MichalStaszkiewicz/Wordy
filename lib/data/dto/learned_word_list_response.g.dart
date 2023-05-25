// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learned_word_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearnedWordListResponse _$LearnedWordListResponseFromJson(
        Map<String, dynamic> json) =>
    LearnedWordListResponse(
      learnedWords: (json['learnedWords'] as List<dynamic>)
          .map((e) => LearnedWordDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LearnedWordListResponseToJson(
        LearnedWordListResponse instance) =>
    <String, dynamic>{
      'learnedWords': instance.learnedWords,
    };
