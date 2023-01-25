import '../../domain/models/course.dart';

class CourseDto {
  CourseDto({required this.translation, required this.word,required this.topic});
  String word;
  String translation;
  String topic;

  Course toDomain() {
    return Course(translation: translation, word: word,topic:topic);
  }
}
