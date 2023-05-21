// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterUserRequest _$RegisterUserRequestFromJson(Map<String, dynamic> json) =>
    RegisterUserRequest(
      email: json['email'] as String,
      password: json['password'] as String,
      fullName: json['fullName'] as String,
    );

Map<String, dynamic> _$RegisterUserRequestToJson(
        RegisterUserRequest instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'password': instance.password,
    };
