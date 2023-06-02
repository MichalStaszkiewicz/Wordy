import 'package:json_annotation/json_annotation.dart';
import 'package:wordy/data/dto/interface_language_response.dart';
import 'package:wordy/data/dto/profile_response.dart';
import 'package:wordy/data/dto/user_settings_response.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  UserResponse({required this.id});

  String id;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}
