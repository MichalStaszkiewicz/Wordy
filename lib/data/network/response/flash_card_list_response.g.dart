// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flash_card_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FlashCardListResponse _$$_FlashCardListResponseFromJson(
        Map<String, dynamic> json) =>
    _$_FlashCardListResponse(
      wordList: (json['wordList'] as List<dynamic>)
          .map((e) => Word.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_FlashCardListResponseToJson(
        _$_FlashCardListResponse instance) =>
    <String, dynamic>{
      'wordList': instance.wordList,
    };
