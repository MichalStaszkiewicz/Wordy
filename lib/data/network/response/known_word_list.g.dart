// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'known_word_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KnownWordList _$$_KnownWordListFromJson(Map<String, dynamic> json) =>
    _$_KnownWordList(
      knownWords: (json['knownWords'] as List<dynamic>)
          .map((e) => Word.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_KnownWordListToJson(_$_KnownWordList instance) =>
    <String, dynamic>{
      'knownWords': instance.knownWords,
    };
