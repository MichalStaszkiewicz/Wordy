// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_interface_language_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserInterfaceLanguageRequest _$UpdateUserInterfaceLanguageRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateUserInterfaceLanguageRequest(
      languageName: json['languageName'] as String,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$UpdateUserInterfaceLanguageRequestToJson(
        UpdateUserInterfaceLanguageRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'languageName': instance.languageName,
    };
