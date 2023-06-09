import 'package:json_annotation/json_annotation.dart';

import '../../domain/models/registeration_status.dart';

part 'registeration_response.g.dart';

@JsonSerializable()
class RegisterationResponse {
  RegisterationResponse({
    required this.id,
    required this.registerationCompleted,
  });
  String id;
  bool registerationCompleted;

  factory RegisterationResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterationResponseFromJson(json);

  RegisterationStatus toDomain() {
    return RegisterationStatus(registerationCompleted: registerationCompleted);
  }
}
