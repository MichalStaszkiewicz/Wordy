// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_interface_language_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserInterfaceLanguageResponse
    _$UpdateUserInterfaceLanguageResponseFromJson(Map<String, dynamic> json) =>
        UpdateUserInterfaceLanguageResponse(
          updatedLanguageName: json['updatedLanguageName'] as String,
          userCoursesInThisLanguage: json['userCoursesInThisLanguage'] as int,
        );

Map<String, dynamic> _$UpdateUserInterfaceLanguageResponseToJson(
        UpdateUserInterfaceLanguageResponse instance) =>
    <String, dynamic>{
      'updatedLanguageName': instance.updatedLanguageName,
      'userCoursesInThisLanguage': instance.userCoursesInThisLanguage,
    };
