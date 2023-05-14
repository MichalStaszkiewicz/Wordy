// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordListResponse _$WordListResponseFromJson(Map<String, dynamic> json) =>
    WordListResponse(
      wordList: (json['wordList'] as List<dynamic>)
          .map((e) => WordDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WordListResponseToJson(WordListResponse instance) =>
    <String, dynamic>{
      'wordList': instance.wordList,
    };
