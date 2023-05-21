import 'package:json_annotation/json_annotation.dart';

part 'user_register_status_response.g.dart';

@JsonSerializable()
class UserRegisterStatusResponse {
  UserRegisterStatusResponse(
      {required this.registrationStatus, required this.userId});
  String userId;
  String registrationStatus;

  factory UserRegisterStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterStatusResponseFromJson(json);
}
