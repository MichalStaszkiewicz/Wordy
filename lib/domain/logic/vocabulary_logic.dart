import 'dart:math';

import 'package:dio/dio.dart';
import 'package:wordy/Utility/utility.dart';
import 'package:wordy/data/local/local_database.dart';
import 'package:wordy/data/local/local_repository_implementation.dart';
import 'package:wordy/data/network/remote_source.dart';
import 'package:wordy/domain/models/course_entry.dart';
import 'package:wordy/domain/models/quiz_question.dart';

import '../../data/network/network_repository_implementation.dart';
import '../models/word.dart';

class VocabularyLogic {
  Future<List<QuizQuestion>> getVocabularyByTopic(String topic) async {
    RemoteSource remoteSource = RemoteSource();
    LocalRepository localRepository = LocalRepository();

    Map<String, dynamic> map = await localRepository.getUserData();
    List<Word> words = await remoteSource.getWordsByTopic({'topic': topic}).then(
        (value) => value!.wordList.map((e) => e.toDomain()).toList());
    List<Word> wordsToRandomAnswers = await remoteSource
        .getAllWords()
        .then((value) => value.wordList.map((e) => e.toDomain()).toList());

    Utility utility = Utility();
    List<QuizQuestion> questions = utility.createListOfQuestions(
      utility.convertWordToCourse(
        words,
        map['courseName'] ?? "",
        map['interfaceLanguage'] ?? "",
      ),
      utility.convertWordToCourse(
        wordsToRandomAnswers,
        map['courseName'] ?? "",
        map['interfaceLanguage'] ?? "",
      ),
    );

    return questions;
  }
}
