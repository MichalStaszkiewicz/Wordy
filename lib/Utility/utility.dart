import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wordy/domain/models/word.dart';
import 'package:wordy/presentation/Widgets/quiz_options.dart';

import '../domain/models/course_entry.dart';
import '../domain/models/quiz_question.dart';

class Utility {
  Utility();

  List<CourseEntry> convertWordToCourse(List<Word> words, String languageToLearn,
      String languageThatUserWillLearnFrom) {
    List<CourseEntry> result = [];

    for (Word word in words) {
      if (languageToLearn.toLowerCase() == "english" &&
          languageThatUserWillLearnFrom.toLowerCase() == "polish") {
        result.add(CourseEntry(
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

  List<QuizQuestion> createListOfQuestions(List<CourseEntry> words) {
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

   Positioned quizSettings(bool show, Offset localPosition,
      Offset globalPosition, int index, String name,BuildContext context,ScrollController controller) {
    if (show == true) {
      var deviceDimensions = MediaQuery.of(context).size;
      Offset showMenuPosition = Offset(globalPosition.dx - localPosition.dx,
          globalPosition.dy - localPosition.dy);

      if (showMenuPosition.dy < 10) {
        Offset offsetAfterJump = Offset(globalPosition.dx - localPosition.dx,
            (globalPosition.dy - (showMenuPosition.dy)) - localPosition.dy);
        controller.animateTo(controller.offset + (showMenuPosition.dy),
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
        return Positioned(
          top: offsetAfterJump.dy + 30,
          left: offsetAfterJump.dx,
          child: QuizOptions(
           title: name,
          ),
        );
      } else if (deviceDimensions.height < showMenuPosition.dy + 180 &&
          showMenuPosition.dy > 10) {
        Offset offsetAfterJump = Offset(globalPosition.dx - localPosition.dx,
            (globalPosition.dy - 180) - localPosition.dy);
        controller.animateTo(controller.offset + 180,
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
        return Positioned(
          top: offsetAfterJump.dy,
          left: offsetAfterJump.dx,
          child: QuizOptions(
            title: name,
       
          ),
        );
      } else {
        return Positioned(
          top: showMenuPosition.dy,
          left: showMenuPosition.dx,
          child: QuizOptions(
            title: name,
        
          ),
        );
      }
    } else {
      return Positioned(child: Container());
    }
  }
}
