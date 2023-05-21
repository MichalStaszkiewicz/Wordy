// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_register_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRegisterStatusResponse _$UserRegisterStatusResponseFromJson(
        Map<String, dynamic> json) =>
    UserRegisterStatusResponse(
      registrationStatus: json['registrationStatus'] as String,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$UserRegisterStatusResponseToJson(
        UserRegisterStatusResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'registrationStatus': instance.registrationStatus,
    };
