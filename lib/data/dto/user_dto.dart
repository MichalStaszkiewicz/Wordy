import 'package:json_annotation/json_annotation.dart';
import 'package:wordy/domain/models/user.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  UserDto(
      {required this.fullName,
      required this.email,
      required this.password,
    });

  String? fullName;
  String email;
  String password;
  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
  User toDomain() {
    return User(
         fullName: fullName, email: email, password: password);
  }
}
