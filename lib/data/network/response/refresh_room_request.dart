import 'package:json_annotation/json_annotation.dart';

part 'refresh_room_request.g.dart';

@JsonSerializable()
class RefreshRoomRequest {
  RefreshRoomRequest({required this.oldToken, required this.newToken});
  String oldToken;
  String newToken;

  Map<String, dynamic> toJson() => _$RefreshRoomRequestToJson(this);
}
