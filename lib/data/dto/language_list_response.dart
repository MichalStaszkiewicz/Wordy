import 'package:json_annotation/json_annotation.dart';

import 'language_dto.dart';
part 'language_list_response.g.dart';

@JsonSerializable()
class LanguageListResponse {
  LanguageListResponse({required this.languages});
  List<LanguageDto> languages;

  factory LanguageListResponse.fromJson(Map<String, dynamic> json) =>
      _$LanguageListResponseFromJson(json);
}
