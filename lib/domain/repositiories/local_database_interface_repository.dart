import 'package:wordy/domain/models/quiz_question.dart';

import '../../data/dto/course_entry_dto.dart';
import '../../data/dto/word_dto.dart';
import '../models/course_entry.dart';

abstract class LocalInterface {
  Future<List<CourseEntryDto>> getUserLearnedWordies();
  void createDatabase();
  void setupDatabase();
  Future<List<CourseEntryDto>> getUserLearnedWordiesWithSpecificTopic(
      String topic);
  Future<Map<String, String>> getUserData();
  Future<int> getLearnedWordiesCountByTopic(String topic,String tableName);
  void insertLearnedWordsToDatabase(List<CourseEntry> words);
}
