// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interface_language_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InterfaceLanguageResponse _$InterfaceLanguageResponseFromJson(
        Map<String, dynamic> json) =>
    InterfaceLanguageResponse(
      name: json['name'] as String,
      image: json['image'] as String,
      id: json['id'] as int,
      circularImage: json['circularImage'] as String,
    );

Map<String, dynamic> _$InterfaceLanguageResponseToJson(
        InterfaceLanguageResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'circularImage': instance.circularImage,
      'id': instance.id,
    };
