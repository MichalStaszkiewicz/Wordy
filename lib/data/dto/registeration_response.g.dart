// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registeration_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterationResponse _$RegisterationResponseFromJson(
        Map<String, dynamic> json) =>
    RegisterationResponse(
      id: json['id'] as int,
      registerationCompleted: json['registerationCompleted'] as bool,
    );

Map<String, dynamic> _$RegisterationResponseToJson(
        RegisterationResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'registerationCompleted': instance.registerationCompleted,
    };
