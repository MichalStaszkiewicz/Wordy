import 'package:json_annotation/json_annotation.dart';
import 'package:wordy/data/dto/user_response.dart';
part 'login_user_response.g.dart';

@JsonSerializable()
class LoginUserResponse {
  LoginUserResponse({required this.message, required this.user});
  String message;
  UserResponse user;
  factory LoginUserResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginUserResponseFromJson(json);
}
