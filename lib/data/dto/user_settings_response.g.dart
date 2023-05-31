// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSettingsResponse _$UserSettingsResponseFromJson(
        Map<String, dynamic> json) =>
    UserSettingsResponse(
      id: json['id'] as int,
      interfaceLanguage: InterfaceLanguageResponse.fromJson(
          json['interfaceLanguage'] as Map<String, dynamic>),
      user: UserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserSettingsResponseToJson(
        UserSettingsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'interfaceLanguage': instance.interfaceLanguage,
    };
