import 'package:json_annotation/json_annotation.dart';

class User {
  static final User _instance = User._internal();

  factory User() {
    return _instance;
  }

  User._internal();

  String? uuid;
  bool registrationStatus = false;
  String interfaceLanguage = 'english';
  String currentCourse = '';

  bool isLogged() {
    return uuid != null;
  }
}