// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      message: json['message'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
    };
