import 'package:json_annotation/json_annotation.dart';
part 'update_user_interface_language_response.g.dart';

@JsonSerializable()
class UpdateUserInterfaceLanguageResponse {
  UpdateUserInterfaceLanguageResponse({required this.updatedLanguageName,required this.userCoursesInThisLanguage});
  String updatedLanguageName;
  int userCoursesInThisLanguage;

  factory UpdateUserInterfaceLanguageResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateUserInterfaceLanguageResponseFromJson(json);
}
