import 'package:json_annotation/json_annotation.dart';
part 'registeration_response.g.dart';

@JsonSerializable()
class RegisterationResponse {
  RegisterationResponse({required this.registerationCompleted});
  bool registerationCompleted;

  factory RegisterationResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterationResponseFromJson(json);
}
