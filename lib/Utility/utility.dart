import 'dart:math';

import 'package:sqflite/sqflite.dart';
import 'package:wordy/domain/models/word.dart';

import '../domain/models/quiz_question.dart';

class Utility {
  Utility();
 List<QuizQuestion> createListOfQuestions(List<Word> words,
      String languageToLearn, String languageThatUserWillLearnFrom) {
    List<QuizQuestion> questions = [];
    for (int i = 0; i < words.length; i++) {
      Random random = Random();
      if (questions.length == 20) {
        break;
      }
      if (languageToLearn.toLowerCase() == "english" &&
          languageThatUserWillLearnFrom.toLowerCase() == "polish") {
        var answers = <String>{};
        while (answers.length < 4) {
          var randomWord = words[random.nextInt(words.length)].polish;
          if (!answers.contains(randomWord)) {
            answers.add(randomWord);
          }
        }
        List<String> answersList = answers.toList();
        var correctAnswerIndex = random.nextInt(4);
        var correctAnswer = words[i].polish;
        answersList[correctAnswerIndex] = correctAnswer;

        questions.add(QuizQuestion(
            answer: words[i].polish,
            questionOptions: answersList,
            question: words[i].english,
            correct_answer_index: correctAnswerIndex));
      }
      if (languageToLearn.toLowerCase() == "spanish" &&
          languageThatUserWillLearnFrom.toLowerCase() == "polish") {
        var answers = <String>{};
        while (answers.length < 4) {
          var randomWord = words[random.nextInt(words.length)].polish;
          if (!answers.contains(randomWord)) {
            answers.add(randomWord);
          }
        }
        List<String> answersList = answers.toList();
        var correctAnswerIndex = random.nextInt(4);
        var correctAnswer = words[i].polish;
        answersList[correctAnswerIndex] = correctAnswer;

        questions.add(QuizQuestion(
            answer: words[i].polish,
            questionOptions: answersList,
            question: words[i].spanish,
            correct_answer_index: correctAnswerIndex));
      }
      if (languageToLearn.toLowerCase() == "french" &&
          languageThatUserWillLearnFrom.toLowerCase() == "polish") {
        var answers = <String>{};
        while (answers.length < 4) {
          var randomWord = words[random.nextInt(words.length)].polish;
          if (!answers.contains(randomWord)) {
            answers.add(randomWord);
          }
        }
        List<String> answersList = answers.toList();
        var correctAnswerIndex = random.nextInt(4);
        var correctAnswer = words[i].polish;
        answersList[correctAnswerIndex] = correctAnswer;

        questions.add(QuizQuestion(
            answer: words[i].polish,
            questionOptions: answersList,
            question: words[i].french,
            correct_answer_index: correctAnswerIndex));
      }
      if (languageToLearn.toLowerCase() == "french" &&
          languageThatUserWillLearnFrom.toLowerCase() == "english") {
        var answers = <String>{};
        while (answers.length < 4) {
          var randomWord = words[random.nextInt(words.length)].polish;
          if (!answers.contains(randomWord)) {
            answers.add(randomWord);
          }
        }
        List<String> answersList = answers.toList();
        var correctAnswerIndex = random.nextInt(4);
        var correctAnswer = words[i].english;
        answersList[correctAnswerIndex] = correctAnswer;

        questions.add(QuizQuestion(
            answer: words[i].english,
            questionOptions: answersList,
            question: words[i].french,
            correct_answer_index: correctAnswerIndex));
      }
      if (languageToLearn.toLowerCase() == "spanish" &&
          languageThatUserWillLearnFrom.toLowerCase() == "english") {
        var answers = <String>{};
        while (answers.length < 4) {
          var randomWord = words[random.nextInt(words.length)].polish;
          if (!answers.contains(randomWord)) {
            answers.add(randomWord);
          }
        }
        List<String> answersList = answers.toList();
        var correctAnswerIndex = random.nextInt(4);
        var correctAnswer = words[i].english;
        answersList[correctAnswerIndex] = correctAnswer;

        questions.add(QuizQuestion(
            answer: words[i].english,
            questionOptions: answersList,
            question: words[i].spanish,
            correct_answer_index: correctAnswerIndex));
      }
      if (languageToLearn.toLowerCase() == "polish" &&
          languageThatUserWillLearnFrom.toLowerCase() == "english") {
        var answers = <String>{};
        while (answers.length < 4) {
          var randomWord = words[random.nextInt(words.length)].polish;
          if (!answers.contains(randomWord)) {
            answers.add(randomWord);
          }
        }
        List<String> answersList = answers.toList();
        var correctAnswerIndex = random.nextInt(4);
        var correctAnswer = words[i].english;
        answersList[correctAnswerIndex] = correctAnswer;

        questions.add(QuizQuestion(
            answer: words[i].english,
            questionOptions: answersList,
            question: words[i].polish,
            correct_answer_index: correctAnswerIndex));
      }
    }

    return questions;
  }
}
