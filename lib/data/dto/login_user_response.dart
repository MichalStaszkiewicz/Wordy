import 'package:json_annotation/json_annotation.dart';
import 'package:wordy/data/dto/user_response.dart';
part 'login_user_response.g.dart';

@JsonSerializable()
class LoginResponse {
  LoginResponse({required this.message, required this.token});
  String message;
  String token;
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginUserResponseFromJson(json);
}
