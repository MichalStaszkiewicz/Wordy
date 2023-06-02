// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_register_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateRegisterationStatusResponse _$UpdateRegisterationStatusResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateRegisterationStatusResponse(
      message: json['message'] as String,
      updatedRegisterStatus: json['updatedRegisterStatus'] as bool,
    );

Map<String, dynamic> _$UpdateRegisterationStatusResponseToJson(
        UpdateRegisterationStatusResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'updatedRegisterStatus': instance.updatedRegisterStatus,
    };
