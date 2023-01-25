import 'dart:math';

import 'package:wordy/Utility/utility.dart';
import 'package:wordy/data/local/local_database.dart';
import 'package:wordy/domain/models/quiz_question.dart';

import '../../data/network/network_repository_implementation.dart';
import '../models/word.dart';

class VocabularyLogic {
  Future<List<QuizQuestion>> getVocabularyByTopic(String topic) async {
    ServerDatabaseOperations server = ServerDatabaseOperations();
    LocalDatabase localDatabase = LocalDatabase();
    Map<String, String> map = await localDatabase.getCurrentCourseInformation();
    List<Word> words = await server
        .getWordies(topic)
        .then((value) => value.map((element) => element.toDomain()).toList());

    Utility utility = Utility();
    List<QuizQuestion> questions = utility.createListOfQuestions(
        words,
        map['courseName'].toString(),
        map['interfaceLanguage'].toString());
        
    return questions;
  }
}
