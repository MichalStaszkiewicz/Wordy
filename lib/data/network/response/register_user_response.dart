import 'package:json_annotation/json_annotation.dart';
part 'register_user_response.g.dart';

@JsonSerializable()
class RegisterUserResponse {
  RegisterUserResponse({required this.message});
  String message;

factory  RegisterUserResponse.fromJson(Map<String, dynamic> json) => _$RegisterUserResponseFromJson(json);
}
