
import '../../data/dto/course_entry_dto.dart';
import '../models/course_entry.dart';

abstract class LocalInterface {
  Future<List<CourseEntryDto>> getUserLearnedWordiesByCurrentNativeLanguage();
  Future<void> createDatabase(String userNativeLanguage, String languageToLearn);
  Future<void> setupDatabase();
  Future<void> insertLearnedWordsToDatabase(List<CourseEntry> words);
  Future<void> updateUserProfile(String fieldToUpdate, String value);
  Future<void> updateDatabaseTable(
      String tableName, String fieldToUpdate, String value);
  Future<List<CourseEntryDto>> getUserLearnedWordiesWithSpecificTopic(
      String topic);
  Future<Map<String, dynamic>> getUserData();
  Future<int> getLearnedWordiesCountByTopic(String topic, String tableName);
  Future<int> getLearnedWordiesCountByTableName(String tableName);
  
}
