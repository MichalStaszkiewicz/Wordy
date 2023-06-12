// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learned_words_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LearnedWordsList _$$_LearnedWordsListFromJson(Map<String, dynamic> json) =>
    _$_LearnedWordsList(
      learnedWords: (json['learnedWords'] as List<dynamic>)
          .map((e) => Word.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_LearnedWordsListToJson(_$_LearnedWordsList instance) =>
    <String, dynamic>{
      'learnedWords': instance.learnedWords,
    };
