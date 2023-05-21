import 'package:json_annotation/json_annotation.dart';

import '../../domain/models/language.dart';
part 'language_response.g.dart';

@JsonSerializable()
class LanguageResponse {
  LanguageResponse({required this.name, required this.image, required this.id});
  String name;
  String image;
  int id;
  factory LanguageResponse.fromJson(Map<String, dynamic> json) =>
      _$LanguageResponseFromJson(json);
  Language toDomain() {
    return Language(image: image, name: name, id: id);
  }
}
