import 'package:json_annotation/json_annotation.dart';
part 'update_registeration_status_response.g.dart';

@JsonSerializable()
class UpdateRegisterationStatusResponse {
  UpdateRegisterationStatusResponse({required this.message});
  String message;

  factory UpdateRegisterationStatusResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateRegisterationStatusResponseFromJson(json);
}
