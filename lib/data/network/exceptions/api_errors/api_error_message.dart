import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
part 'api_error_message.g.dart';

@JsonSerializable()
class ApiErrorMessage {
  ApiErrorMessage(
      {required this.statusCode, required this.error, required this.message});
  int statusCode;
  String error;
  String message;

  factory ApiErrorMessage.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorMessageFromJson(json);
}
