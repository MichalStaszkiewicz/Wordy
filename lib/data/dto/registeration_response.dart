import 'package:json_annotation/json_annotation.dart';
import 'package:wordy/data/dto/user_response.dart';

import '../../domain/models/registeration_status.dart';

part 'registeration_response.g.dart';

@JsonSerializable()
class RegisterationResponse {
  RegisterationResponse(
      {required this.id,
      required this.registerationCompleted,
      required this.user});
  int id;
  bool registerationCompleted;
  UserResponse user;
  factory RegisterationResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterationResponseFromJson(json);

  RegisterationStatus toDomain() {
    return RegisterationStatus(registerationCompleted: registerationCompleted);
  }
}
