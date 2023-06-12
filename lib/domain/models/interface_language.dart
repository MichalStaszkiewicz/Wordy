import 'package:freezed_annotation/freezed_annotation.dart';

part 'interface_language.freezed.dart';
part 'interface_language.g.dart';

@freezed
class InterfaceLanguage with _$InterfaceLanguage {
  factory InterfaceLanguage({
    required String name,
    required String image,
    required String circularImage,
  }) = _InterfaceLanguage;

  factory InterfaceLanguage.fromJson(Map<String, dynamic> json) =>
      _$InterfaceLanguageFromJson(json);
}
