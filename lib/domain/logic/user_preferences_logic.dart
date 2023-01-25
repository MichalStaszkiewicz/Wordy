import 'package:wordy/data/local/local_database.dart';
import 'package:wordy/data/local/local_repository_implementation.dart';
import 'package:wordy/domain/models/course.dart';
import 'package:wordy/domain/models/quiz_question.dart';

import '../models/word.dart';

class UserPreferencesLogic {
  UserPreferencesLogic();

  void insertLearnedWordsToDatabase(List<Course> wordsToInsert) async {
    LocalRepository localRepository = LocalRepository();
    List<Course> userLearnedWordsAlready = await localRepository
        .getUserLearnedWordies()
        .then((value) => value.map((e) => e.toDomain()).toList());
    for (Course word in wordsToInsert) {



    }
  }
}
