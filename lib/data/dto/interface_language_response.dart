import 'package:json_annotation/json_annotation.dart';

import '../../domain/models/interface_language.dart';
part 'interface_language_response.g.dart';

@JsonSerializable()
class InterfaceLanguageResponse {
  InterfaceLanguageResponse(
      {required this.name, required this.image, required this.id});
  String name;
  String image;
  int id;
  factory InterfaceLanguageResponse.fromJson(Map<String, dynamic> json) =>
      _$InterfaceLanguageResponseFromJson(json);
  InterfaceLanguage toDomain() {
    return InterfaceLanguage(
      image: image,
      name: name,
    );
  }
}
