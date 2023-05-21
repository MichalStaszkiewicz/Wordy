import 'package:json_annotation/json_annotation.dart';

part 'update_register_status_response.g.dart';

@JsonSerializable()
class UpdateRegisterStatusResponse {
  UpdateRegisterStatusResponse({required this.message,required this.updatedRegisterStatus});
  String message;
  bool updatedRegisterStatus;

  factory UpdateRegisterStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateRegisterStatusResponseFromJson(json);
}
