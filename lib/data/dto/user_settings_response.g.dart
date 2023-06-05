// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSettingsResponse _$UserSettingsResponseFromJson(
        Map<String, dynamic> json) =>
    UserSettingsResponse(
      id: json['id'] as String,
      interfaceLanguage: InterfaceLanguageResponse.fromJson(
          json['interfaceLanguage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserSettingsResponseToJson(
        UserSettingsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'interfaceLanguage': instance.interfaceLanguage,
    };
