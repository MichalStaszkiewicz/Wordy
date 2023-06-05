// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorMessage _$ApiErrorMessageFromJson(Map<String, dynamic> json) =>
    ApiErrorMessage(
      statusCode: json['statusCode'] as int,
      error: json['error'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$ApiErrorMessageToJson(ApiErrorMessage instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'error': instance.error,
      'message': instance.message,
    };
