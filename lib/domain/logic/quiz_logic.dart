import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:wordy/data/local/local_database.dart';
import 'package:wordy/data/local/local_repository_implementation.dart';
import 'package:wordy/domain/models/quiz_question.dart';

import '../../Utility/utility.dart';
import '../../data/network/network_repository_implementation.dart';
import '../models/course.dart';
import '../models/word.dart';

class QuizLogic {
  Future<List<QuizQuestion>> createLearningQuiz(String topic) async {
    Utility utility = Utility();
    LocalRepository local = LocalRepository();

    ServerDatabaseOperations remote = ServerDatabaseOperations();

    List<Word> allWords = [];
    List<Course> userLearned = await local
        .getUserLearnedWordies()
        .then((value) => value.map((element) => element.toDomain()).toList());
    allWords = await remote
        .getWordies(topic)
        .then((value) => value.map((element) => element.toDomain()).toList());

    Map<String, String> map = await local.getCurrentCourseInformation();

    List<Course> filtredWords = utility.convertWordToCourse(
        allWords, map['courseName'] ?? "", map['interfaceLanguage'] ?? "");
    List<Course> result = [];

    for (int i = 0; i < filtredWords.length; i++) {
      if (!userLearned.contains(Course(
          translation: filtredWords[i].translation,
          word: filtredWords[i].word))) {
        result.add(filtredWords[i]);
      }
    }


    List<QuizQuestion> questions = utility.createListOfQuestions(result);

    return questions;
  }

  Future<List<QuizQuestion>> createReviewQuiz(String topic) async {
    Utility utility = Utility();
    LocalRepository localRepository = LocalRepository();

    Map<String, String> map =
        await localRepository.getCurrentCourseInformation();

    List<Course> learnedWords = await localRepository
        .getUserLearnedWordiesWithSpecificTopic(topic)
        .then((value) => value.map((e) => e.toDomain()).toList());

    List<QuizQuestion> questions = utility.createListOfQuestions(
      learnedWords,
    );

    return questions;
  }
}
