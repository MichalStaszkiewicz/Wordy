// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UpdateUserInterfaceLanguageModel {
  String userId;
  String languageName;
  UpdateUserInterfaceLanguageModel({
    required this.userId,
    required this.languageName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'languageName': languageName,
    };
  }
}
