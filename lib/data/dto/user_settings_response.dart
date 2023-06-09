import 'package:json_annotation/json_annotation.dart';
import 'package:wordy/data/dto/interface_language_response.dart';

import '../../domain/models/user_settings.dart';
part 'user_settings_response.g.dart';

@JsonSerializable()
class UserSettingsResponse {
  UserSettingsResponse({
    required this.id,
    required this.interfaceLanguage,
  });
  String id;

  InterfaceLanguageResponse interfaceLanguage;

  factory UserSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsResponseFromJson(json);
  UserSettings toDomain() {
    return UserSettings(language: interfaceLanguage.toDomain());
  }
}
