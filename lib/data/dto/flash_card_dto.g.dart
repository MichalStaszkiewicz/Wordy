// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flash_card_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlashCardDto _$FlashCardDtoFromJson(Map<String, dynamic> json) => FlashCardDto(
      question: json['question'] as String,
      answer: json['answer'] as String,
    );

Map<String, dynamic> _$FlashCardDtoToJson(FlashCardDto instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answer': instance.answer,
    };
