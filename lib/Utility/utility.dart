import 'dart:math';

import 'package:sqflite/sqflite.dart';
import 'package:wordy/domain/models/word.dart';

import '../domain/models/course.dart';
import '../domain/models/quiz_question.dart';

class Utility {
  Utility();

  List<Course> convertWordToCourse(List<Word> words, String languageToLearn,
      String languageThatUserWillLearnFrom) {
    List<Course> result = [];

    for (Word word in words) {
      if (languageToLearn.toLowerCase() == "english" &&
          languageThatUserWillLearnFrom.toLowerCase() == "polish") {
        result.add(Course(translation: word.english, word: word.polish));
      }
    }
    return result;
  }

  Map<String, String> convertCurrentCourseName(
      String courseName, String interfaceLanguage) {
    Map<String, String> map = {};
    String courseNameTable = "${interfaceLanguage}To$courseName";

    map.addAll({
      "courseNameTable": courseNameTable,
      "courseName": courseName,
      "interfaceLanguage": interfaceLanguage
    });
    return map;
  }

  List<QuizQuestion> createListOfQuestions(List<Course> words) {
    List<QuizQuestion> questions = [];
    for (int i = 0; i < words.length; i++) {
      Random random = Random();
      if (questions.length == 20) {
        break;
      }

      var answers = <String>{};
      while (answers.length < 4) {
        var randomWord = words[random.nextInt(words.length)].word;
        if (!answers.contains(randomWord)) {
          answers.add(randomWord);
        }
      }
      List<String> answersList = answers.toList();
      var correctAnswerIndex = random.nextInt(4);
      var correctAnswer = words[i].word;
      answersList[correctAnswerIndex] = correctAnswer;

      questions.add(QuizQuestion(
          answer: words[i].word,
          questionOptions: answersList,
          question: words[i].translation,
          correct_answer_index: correctAnswerIndex));
    }

    return questions;
  }
}
