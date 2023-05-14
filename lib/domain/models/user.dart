import 'package:json_annotation/json_annotation.dart';

import '../../data/dto/user_dto.dart';

class User {
  User(
      {
      required this.fullName,
      required this.email,
      required this.password});

  String? fullName;
  String email;
  String password;

  UserDto toDto() {
    return UserDto(
        email: email, fullName: fullName, password: password,);
  }
}

