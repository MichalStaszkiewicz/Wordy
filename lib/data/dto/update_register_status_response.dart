import 'package:json_annotation/json_annotation.dart';

part 'update_register_status_response.g.dart';

@JsonSerializable()
class UpdateRegisterationStatusResponse {
  UpdateRegisterationStatusResponse(
      {required this.message, required this.updatedRegisterStatus});
  String message;
  bool updatedRegisterStatus;

  factory UpdateRegisterationStatusResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateRegisterationStatusResponseFromJson(json);
}
