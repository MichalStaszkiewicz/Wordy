import 'package:json_annotation/json_annotation.dart';

import 'language_response.dart';
part 'language_list_response.g.dart';

@JsonSerializable()
class LanguageListResponse {
  LanguageListResponse({required this.languages});
  List<LanguageResponse> languages;

  factory LanguageListResponse.fromJson(Map<String, dynamic> json) =>
      _$LanguageListResponseFromJson(json);
}
