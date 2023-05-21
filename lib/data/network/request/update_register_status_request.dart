import 'package:json_annotation/json_annotation.dart';

part 'update_register_status_request.g.dart';

@JsonSerializable()
class UpdateRegisterStatusRequest {
  UpdateRegisterStatusRequest({required this.userId});
  String userId;

  Map<String, dynamic> toJson() => _$UpdateRegisterStatusRequestToJson(this);
}
