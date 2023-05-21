import 'package:json_annotation/json_annotation.dart';
import 'package:wordy/data/dto/language_response.dart';
part 'user_data_response.g.dart';

@JsonSerializable()
class UserDataResponse {
  UserDataResponse(
      {required this.email,
      required this.password,
      required this.fullName,
      required this.id,
      required this.interfaceLanguage,
      required this.registrationStatus});
  bool registrationStatus;
  String id;
  String fullName;
  String email;
  String password;
  LanguageResponse interfaceLanguage;

  factory UserDataResponse.fromJson(Map<String, dynamic> json) =>
      _$UserDataResponseFromJson(json);
}
