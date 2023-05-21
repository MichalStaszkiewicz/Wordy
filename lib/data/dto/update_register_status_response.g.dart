// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_register_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateRegisterStatusResponse _$UpdateRegisterStatusResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateRegisterStatusResponse(
      message: json['message'] as String,
      updatedRegisterStatus: json['updatedRegisterStatus'] as bool,
    );

Map<String, dynamic> _$UpdateRegisterStatusResponseToJson(
        UpdateRegisterStatusResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'updatedRegisterStatus': instance.updatedRegisterStatus,
    };
