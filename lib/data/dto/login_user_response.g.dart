// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginUserResponse _$LoginUserResponseFromJson(Map<String, dynamic> json) =>
    LoginUserResponse(
      message: json['message'] as String,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$LoginUserResponseToJson(LoginUserResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'userId': instance.userId,
    };
