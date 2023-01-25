import 'dart:math';

import 'package:wordy/data/local/local_database.dart';
import 'package:wordy/data/local/local_repository_implementation.dart';
import 'package:wordy/domain/models/quiz_question.dart';

import '../../Utility/utility.dart';
import '../../data/network/network_repository_implementation.dart';
import '../models/word.dart';

class QuizLogic {
  Future<List<QuizQuestion>> createLearningQuiz(String topic) async {
    Utility utility = Utility();
    LocalRepository local = LocalRepository();
    LocalDatabase localDB = LocalDatabase();
    ServerDatabaseOperations remote = ServerDatabaseOperations();

    List<Word> allWords = [];
    List<Word> userLearned = await local
        .getUserLearnedWordies()
        .then((value) => value.map((element) => element.toDomain()).toList());
    allWords = await remote
        .getWordies(topic)
        .then((value) => value.map((element) => element.toDomain()).toList());
    localDB.connect();
    Map<String, String> map = await localDB.getCurrentCourseInformation();
    localDB.close();
    List<Word> filtredWords = [];

    for (Word word in allWords) {
      if (!userLearned.contains(word)) {
        filtredWords.add(word);
      }
    }

    String languageToLearn = map['courseName'] ?? "";
    String languageThatUserWillLearnFrom = map['interfaceLanguage'] ?? "";
    
    List<QuizQuestion> questions = utility.createListOfQuestions(
        filtredWords, languageToLearn, languageThatUserWillLearnFrom);

    return questions;
  }

 

  Future<List<QuizQuestion>> createReviewQuiz(String topic) async {
    Utility utility = Utility(); 
    LocalDatabase localDB = LocalDatabase();
    var connection = await localDB.connect();
    var results = await connection
        .query("SELECT * FROM translations WHERE Topic = $topic");
    List<Word> words = [];
    connection.close();

    Map<String, String> map = await localDB.getCurrentCourseInformation();
    String languageToLearn = map['courseName'] ?? "";
    String languageThatUserWillLearnFrom = map['interfaceLanguage'] ?? "";
    for (int i = 0; i < results.length; i++) {
      words.add(Word(
          polish: results.elementAt(i)['Polish'].toString(),
          english: results.elementAt(i)['English'].toString(),
          french: results.elementAt(i)['French'].toString(),
          spanish: results.elementAt(i)['Spanish'].toString()));
    }
    List<QuizQuestion> questions = utility.createListOfQuestions(words, languageToLearn, languageThatUserWillLearnFrom);

   
    return questions;
  }
}
