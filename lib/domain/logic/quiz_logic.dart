import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:wordy/data/local/local_database.dart';
import 'package:wordy/data/local/local_repository_implementation.dart';
import 'package:wordy/data/network/remote_source.dart';
import 'package:wordy/domain/models/quiz_question.dart';

import '../../Utility/utility.dart';
import '../../data/network/network_repository_implementation.dart';
import '../models/course_entry.dart';
import '../models/word.dart';

class QuizLogic {
  Future<List<QuizQuestion>> createLearningQuiz(String topic) async {
    Utility utility = Utility();
    LocalRepository local = LocalRepository();
    RemoteSource remoteSource = RemoteSource();
    List<Word> allWords = [];
    List<CourseEntry> userLearned = await local
        .getUserLearnedWordiesByCurrentNativeLanguage()
        .then((value) => value.map((element) => element.toDomain()).toList());
    allWords = await remoteSource.getWordsByTopic({topic: topic}).then(
        (value) => value!.wordList.map((e) => e.toDomain()).toList());

    Map<String, dynamic> map = await local.getUserData();

    List<CourseEntry> filtredWords = utility.convertWordToCourse(
        allWords, map['courseName'] ?? "", map['interfaceLanguage'] ?? "");
    List<CourseEntry> result = [];

    for (int i = 0; i < filtredWords.length; i++) {
      if (!userLearned.contains(CourseEntry(
          translation: filtredWords[i].translation,
          word: filtredWords[i].word,
          topic: filtredWords[i].topic))) {
        result.add(filtredWords[i]);
      }
    }

    List<QuizQuestion> questions =
        utility.createListOfQuestions(result, filtredWords);

    return questions;
  }

  Future<List<QuizQuestion>> createReviewQuiz(String topic) async {
    Utility utility = Utility();
    LocalRepository localRepository = LocalRepository();

    Map<String, dynamic> map = await localRepository.getUserData();

    List<CourseEntry> learnedWords = await localRepository
        .getUserLearnedWordiesWithSpecificTopic(topic)
        .then((value) => value.map((e) => e.toDomain()).toList());

    List<QuizQuestion> questions =
        utility.createListOfQuestions(learnedWords, learnedWords);

    return questions;
  }
}
