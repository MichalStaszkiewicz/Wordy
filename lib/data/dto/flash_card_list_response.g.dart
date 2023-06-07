// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flash_card_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlashCardListResponse _$FlashCardListResponseFromJson(
        Map<String, dynamic> json) =>
    FlashCardListResponse(
      wordList: (json['wordList'] as List<dynamic>)
          .map((e) => FlashCardDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FlashCardListResponseToJson(
        FlashCardListResponse instance) =>
    <String, dynamic>{
      'wordList': instance.wordList,
    };
