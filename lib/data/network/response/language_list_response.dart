import 'package:json_annotation/json_annotation.dart';
import 'package:wordy/domain/models/interface_language.dart';
part 'language_list_response.g.dart';

@JsonSerializable()
class LanguageListResponse {
  LanguageListResponse({required this.languages, });
  List<InterfaceLanguage> languages;

  factory LanguageListResponse.fromJson(Map<String, dynamic> json) =>
      _$LanguageListResponseFromJson(json);
}
