import '../../domain/models/course.dart';

class CourseDto {
  CourseDto({required this.translation, required this.word});
  String word;
  String translation;

  Course toDomain() {
    return Course(translation: translation, word: word);
  }
}
