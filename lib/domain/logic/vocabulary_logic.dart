import 'dart:math';

import 'package:wordy/Utility/utility.dart';
import 'package:wordy/data/local/local_database.dart';
import 'package:wordy/data/local/local_repository_implementation.dart';
import 'package:wordy/domain/models/quiz_question.dart';

import '../../data/network/network_repository_implementation.dart';
import '../models/word.dart';

class VocabularyLogic {
  Future<List<QuizQuestion>> getVocabularyByTopic(String topic) async {
    ServerDatabaseOperations server = ServerDatabaseOperations();
    LocalRepository localRepository = LocalRepository();

    Map<String, dynamic> map = await localRepository.getUserData();
    List<Word> words = await server
        .getWordiesByTopic(topic)
        .then((value) => value.map((element) => element.toDomain()).toList());
   
    Utility utility = Utility();
    List<QuizQuestion> questions = utility.createListOfQuestions(utility.convertWordToCourse(words, map['courseName']??"", map['interfaceLanguage']??""),
       );
 
    return questions;
  }
}
