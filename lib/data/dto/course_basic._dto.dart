import '../../domain/models/course_basic.dart';

class CourseBasicDto {
  CourseBasicDto(
      {required this.flag,
      required this.language,
      required this.nativeLanguage});
  String flag;
  String nativeLanguage;
  String language;
  CourseBasic toDomain() {
    return CourseBasic(
        flag: flag, language: language, nativeLanguage: nativeLanguage);
  }
}
