import 'package:wordy/Utility/utility.dart';
import 'package:wordy/data/local/local_database.dart';
import 'package:wordy/data/local/local_repository_implementation.dart';
import 'package:wordy/domain/models/course.dart';
import 'package:wordy/domain/models/course_entry.dart';
import 'package:wordy/domain/models/quiz_question.dart';

import '../../data/network/network_repository_implementation.dart';
import '../models/word.dart';

class UserPreferencesLogic {
  UserPreferencesLogic();

  void insertLearnedWordsToDatabase(List<CourseEntry> wordsToInsert) async {
    LocalRepository localRepository = LocalRepository();
    List<CourseEntry> userLearnedWordsAlready = await localRepository
        .getUserLearnedWordies()
        .then((value) => value.map((e) => e.toDomain()).toList());
    List<CourseEntry> result = [];

    for (CourseEntry word in wordsToInsert) {
      if (!userLearnedWordsAlready.contains(word)) {
        result.add(word);
      }
      localRepository.insertLearnedWordsToDatabase(result);
    }
  }

  Future<List<Course>> getCoursesData() async {
    LocalRepository localRepository = LocalRepository();

    List<Course> result = await localRepository
        .getUserWordsLearned()
        .then((value) => value.map((e) => e.toDomain()).toList());
      
    return result;
  }
}
