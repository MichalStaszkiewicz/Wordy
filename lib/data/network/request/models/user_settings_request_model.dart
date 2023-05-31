// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserSettingsRequestModel {
  String userId;
  UserSettingsRequestModel({
    required this.userId,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
    };
  }

  String toJson() => json.encode(toMap());
}
