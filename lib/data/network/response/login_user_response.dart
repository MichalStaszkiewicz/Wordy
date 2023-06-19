import 'package:json_annotation/json_annotation.dart';
part 'login_user_response.g.dart';

@JsonSerializable()
class LoginUserResponse {
  LoginUserResponse(
      {required this.message,
      required this.accessToken,
      required this.refreshToken});
  String message;
  String accessToken;
  String refreshToken;

  factory LoginUserResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginUserResponseFromJson(json);
}
