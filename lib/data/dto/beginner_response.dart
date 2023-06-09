import 'package:json_annotation/json_annotation.dart';

import '../../domain/models/beginner.dart';

part 'beginner_response.g.dart';

@JsonSerializable()
class BeginnerResponse {
  BeginnerResponse({required this.id, required this.name});
  int id;
  String name;
  factory BeginnerResponse.fromJson(Map<String, dynamic> json) =>
      _$BeginnerResponseFromJson(json);
  Beginner toDomain() {
    return Beginner(name: name);
  }
}
