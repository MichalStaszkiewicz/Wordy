// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataResponse _$UserDataResponseFromJson(Map<String, dynamic> json) =>
    UserDataResponse(
      email: json['email'] as String,
      password: json['password'] as String,
      fullName: json['fullName'] as String,
      id: json['id'] as String,
      interfaceLanguage: LanguageResponse.fromJson(
          json['interfaceLanguage'] as Map<String, dynamic>),
      registrationStatus: json['registrationStatus'] as bool,
    );

Map<String, dynamic> _$UserDataResponseToJson(UserDataResponse instance) =>
    <String, dynamic>{
      'registrationStatus': instance.registrationStatus,
      'id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'password': instance.password,
      'interfaceLanguage': instance.interfaceLanguage,
    };
