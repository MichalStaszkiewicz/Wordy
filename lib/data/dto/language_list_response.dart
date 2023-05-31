import 'package:json_annotation/json_annotation.dart';

import 'interface_language_response.dart';
part 'language_list_response.g.dart';

@JsonSerializable()
class LanguageListResponse {
  LanguageListResponse({required this.languages});
  List<InterfaceLanguageResponse> languages;

  factory LanguageListResponse.fromJson(Map<String, dynamic> json) =>
      _$LanguageListResponseFromJson(json);
}
