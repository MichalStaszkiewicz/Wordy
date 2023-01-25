import 'package:wordy/domain/models/quiz_question.dart';

import '../../data/dto/course_dto.dart';
import '../../data/dto/word_dto.dart';

abstract class LocalInterface {
  Future<List<CourseDto>> getUserLearnedWordies();
  void createDatabase();
  void setupDatabase();
  Future<List<CourseDto>> getUserLearnedWordiesWithSpecificTopic(String topic);
  Future<Map<String, String>> getCurrentCourseInformation();
}
