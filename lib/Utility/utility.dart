import 'dart:collection';
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
        result.add(Course(
            translation: word.english, word: word.polish, topic: word.topic));
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
    HashSet<String> usedWords = HashSet<String>();
    for (int i = 0; i < words.length; i++) {
      Random random = Random();
      if (questions.length == 20) {
        break;
      }

      while (usedWords.length < 4) {
        var randomWord = words[random.nextInt(words.length)].word;
        if (!usedWords.contains(randomWord)) {
          usedWords.add(randomWord);
        }
      }
      List<String> answersList = usedWords.toList();
      var correctAnswerIndex = 0;
      var correctAnswer = words[i].word;
     
      if (usedWords.contains(correctAnswer)) {
    
        for (int i = 0; i < usedWords.length; i++) {
          if (usedWords.elementAt(i) == correctAnswer) {
            answersList[i] = correctAnswer;
            correctAnswerIndex = i;
          }
        }
      } else {
        correctAnswerIndex = random.nextInt(4);
        answersList[correctAnswerIndex] = correctAnswer;
      }

      questions.add(QuizQuestion(
          answer: words[i].word,
          questionOptions: answersList,
          question: words[i].translation,
          correct_answer_index: correctAnswerIndex));

      usedWords.remove(correctAnswer);
    }

    return questions;
  }
}
