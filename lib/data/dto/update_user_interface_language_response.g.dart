// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_interface_language_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserInterfaceLanguageResponse
    _$UpdateUserInterfaceLanguageResponseFromJson(Map<String, dynamic> json) =>
        UpdateUserInterfaceLanguageResponse(
          message: json['message'] as String,
          updatedLanguageName: json['updatedLanguageName'] as String,
        );

Map<String, dynamic> _$UpdateUserInterfaceLanguageResponseToJson(
        UpdateUserInterfaceLanguageResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'updatedLanguageName': instance.updatedLanguageName,
    };