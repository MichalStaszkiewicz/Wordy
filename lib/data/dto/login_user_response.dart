import 'package:json_annotation/json_annotation.dart';
part 'login_user_response.g.dart';
@JsonSerializable()
class LoginUserResponse {
  LoginUserResponse({required this.message,required this.userId});
  String message;
  String userId;
  factory LoginUserResponse.fromJson(Map<String,dynamic> json)=>_$LoginUserResponseFromJson(json);
}
