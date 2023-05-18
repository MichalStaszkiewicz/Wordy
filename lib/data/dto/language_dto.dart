import 'package:json_annotation/json_annotation.dart';

import '../../domain/models/language.dart';
part 'language_dto.g.dart';

@JsonSerializable()
class LanguageDto {
  LanguageDto({required this.name, required this.image});
  String name;
  String image;
  factory LanguageDto.fromJson(Map<String, dynamic> json) =>
      _$LanguageDtoFromJson(json);
  Language toDomain() {
    return Language(image: image, name: name);
  }
}
