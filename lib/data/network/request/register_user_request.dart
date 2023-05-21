import 'package:json_annotation/json_annotation.dart';

part 'register_user_request.g.dart';

@JsonSerializable()
class RegisterUserRequest {
  RegisterUserRequest(
      {required this.email, required this.password, required this.fullName});
  String fullName;
  String email;
  String password;
  Map<String, dynamic> toJson() => _$RegisterUserRequestToJson(this);
  factory RegisterUserRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserRequestFromJson(json);
}
