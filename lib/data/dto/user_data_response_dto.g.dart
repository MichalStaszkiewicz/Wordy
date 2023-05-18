// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataResponseDto _$UserDataResponseDtoFromJson(Map<String, dynamic> json) =>
    UserDataResponseDto(
      email: json['email'] as String,
      password: json['password'] as String,
      fullName: json['fullName'] as String,
      id: json['id'] as String,
      interfaceLanguage: LanguageDto.fromJson(
          json['interfaceLanguage'] as Map<String, dynamic>),
      registrationStatus: json['registrationStatus'] as bool,
    );

Map<String, dynamic> _$UserDataResponseDtoToJson(
        UserDataResponseDto instance) =>
    <String, dynamic>{
      'registrationStatus': instance.registrationStatus,
      'id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'password': instance.password,
      'interfaceLanguage': instance.interfaceLanguage,
    };
