// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguageListResponse _$LanguageListResponseFromJson(
        Map<String, dynamic> json) =>
    LanguageListResponse(
      languages: (json['languages'] as List<dynamic>)
          .map((e) => LanguageResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LanguageListResponseToJson(
        LanguageListResponse instance) =>
    <String, dynamic>{
      'languages': instance.languages,
    };
