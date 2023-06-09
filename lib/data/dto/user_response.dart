import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  UserResponse({required this.id});

  String id;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}
