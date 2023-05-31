import 'package:json_annotation/json_annotation.dart';
import 'package:wordy/data/dto/interface_language_response.dart';
import 'package:wordy/data/dto/profile_response.dart';
import 'package:wordy/data/dto/user_settings_response.dart';

import '../../domain/models/user.dart';
part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  UserResponse({
    required this.email,
    required this.password,
    required this.id,
    required this.profile,
  });

  String id;
  String email;
  String password;
  ProfileResponse profile;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  User toDomain() {
    return User(id: id, profile: profile.toDomain());
  }
}
