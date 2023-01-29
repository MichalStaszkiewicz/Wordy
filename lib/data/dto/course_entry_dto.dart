import '../../domain/models/course_entry.dart';

class CourseEntryDto {
  CourseEntryDto({required this.translation, required this.word,required this.topic});
  String word;
  String translation;
  String topic;

  CourseEntry toDomain() {
    return CourseEntry(translation: translation, word: word,topic:topic);
  }
}
