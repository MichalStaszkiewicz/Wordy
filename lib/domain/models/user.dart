import 'package:json_annotation/json_annotation.dart';
import 'package:wordy/domain/models/profile.dart';
import 'package:wordy/domain/models/registeration_status.dart';
import 'package:wordy/domain/models/user_settings.dart';

import 'course.dart';
import 'interface_language.dart';

class User {
  static final User _instance = User._internal();

  factory User(
      {String? id,
      RegisterationStatus? registersationStatus,
      Profile? profile,
      UserSettings? userSettings}) {
    _instance.id = id;
    _instance.profile = profile;
    _instance.registersationStatus = registersationStatus;
    _instance.userSettings = userSettings;
    return _instance;
  }
  User._internal();

  String? id;
  RegisterationStatus? registersationStatus;
  Profile? profile;
  UserSettings? userSettings;

  bool isLogged() {
    return id != null;
  }
}
