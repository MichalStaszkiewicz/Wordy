import 'package:json_annotation/json_annotation.dart';

part 'register_status_response.g.dart';

@JsonSerializable()
class RegisterStatusResponse {
  RegisterStatusResponse({required this.registerationStatus});
  bool registerationStatus;


  factory RegisterStatusResponse.fromJson(Map<String,dynamic> json)=>_$RegisterStatusResponseFromJson(json);
}
