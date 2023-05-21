import 'package:json_annotation/json_annotation.dart';
part 'update_user_interface_language_request.g.dart';

@JsonSerializable()
class UpdateUserInterfaceLanguageRequest {
  UpdateUserInterfaceLanguageRequest(
      {required this.languageName, required this.userId});
  String userId;
  String languageName;

  Map<String, dynamic> toJson() =>
      _$UpdateUserInterfaceLanguageRequestToJson(this);
  factory UpdateUserInterfaceLanguageRequest.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateUserInterfaceLanguageRequestFromJson(json);
}
