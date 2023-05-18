import 'package:json_annotation/json_annotation.dart';
import 'package:wordy/data/dto/language_dto.dart';
part 'user_data_response_dto.g.dart';

@JsonSerializable()
class UserDataResponseDto {
  UserDataResponseDto(
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
  LanguageDto interfaceLanguage;

  factory UserDataResponseDto.fromJson(Map<String, dynamic> json) =>
      _$UserDataResponseDtoFromJson(json);
}
