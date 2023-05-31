import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserSettingsRequest {
  String userId;
  UserSettingsRequest({
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
    };
  }

  factory UserSettingsRequest.fromMap(Map<String, dynamic> map) {
    return UserSettingsRequest(
      userId: map['userId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserSettingsRequest.fromJson(String source) =>
      UserSettingsRequest.fromMap(json.decode(source) as Map<String, dynamic>);
}
