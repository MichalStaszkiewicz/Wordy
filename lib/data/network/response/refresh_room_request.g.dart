// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_room_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshRoomRequest _$RefreshRoomRequestFromJson(Map<String, dynamic> json) =>
    RefreshRoomRequest(
      oldToken: json['oldToken'] as String,
      newToken: json['newToken'] as String,
    );

Map<String, dynamic> _$RefreshRoomRequestToJson(RefreshRoomRequest instance) =>
    <String, dynamic>{
      'oldToken': instance.oldToken,
      'newToken': instance.newToken,
    };
