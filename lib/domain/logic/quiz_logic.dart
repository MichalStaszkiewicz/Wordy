import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:wordy/data/local/local_database.dart';
import 'package:wordy/data/local/local_repository_implementation.dart';
import 'package:wordy/data/network/remote_source.dart';
import 'package:wordy/data/network/request/models/begginer_quiz_request_model.dart';
import 'package:wordy/domain/models/quiz_question.dart';
import 'package:wordy/domain/repositiories/repository.dart';
import 'package:wordy/presentation/Bloc/quiz/quiz_bloc.dart';

import '../../Utility/utility.dart';
import '../../data/network/network_repository_implementation.dart';
import '../../data/network/request/models/words_by_topic_request_model.dart';
import '../../localizator.dart';
import '../models/beginner_question.dart';
import '../models/beginner_quiz_question.dart';
import '../models/course_entry.dart';
import '../models/learned_word.dart';
import '../models/user.dart';
import '../models/word.dart';

class QuizLogic {
  Repository _repository = Repository();
  final _user = locator<User>();
  Future<List<BeginnerQuestion>> createBeginnerQuiz(String topic) async {
    List<LearnedWord> learnedWords = await _repository
        .getLearnedWordList(_user.uuid!)
        .then((value) => value.learnedWords.map((e) => e.toDomain()).toList());
    List<BeginnerQuizQuestion> questions = await _repository
        .getBeginnerQuizWordList(BeginnerQuizModel(
            topic: topic,
            interfaceLanguage: _user.interfaceLanguage,
            course: _user.currentCourse))
        .then((value) =>
            value.beginnerQuizWordList.map((e) => e.toDomain()).toList());
    List<String> possibleAnswers = [];
    List<BeginnerQuestion> quizQuestions = [];
    List<BeginnerQuizQuestion> filteredQuestions = [];
    for (BeginnerQuizQuestion question in questions) {
      if (!learnedWords.contains(
          LearnedWord(question: question.question, answer: question.answer))) {
        filteredQuestions.add(question);
      }
    }
    for (BeginnerQuizQuestion question in questions) {
      possibleAnswers.add(question.answer);
    }
    if (filteredQuestions.length >= 10) {
      List<int> questionIndexes = [];
      for (int i = 0; i < 10;) {
        Random random = Random();

        int randomQuestionIndex = random.nextInt(filteredQuestions.length);
        List<String> answers = [];
        int correctAnswerIndex = 0;
        if (!questionIndexes.contains(randomQuestionIndex) &&
            !learnedWords.any((word) =>
                word.question == questions[randomQuestionIndex].question)) {
          questionIndexes.add(randomQuestionIndex);
          while (answers.length < 4) {
            int randomAnswerIndex = random.nextInt(questions.length);
            if (!answers
                .contains(filteredQuestions[randomAnswerIndex].answer)) {
              answers.add(filteredQuestions[randomAnswerIndex].answer);
            }
          }
          if (answers.contains(filteredQuestions[randomQuestionIndex].answer)) {
            correctAnswerIndex = answers.indexWhere((element) =>
                element == filteredQuestions[randomQuestionIndex].answer);
          } else {
            correctAnswerIndex = random.nextInt(3);
            answers[correctAnswerIndex] =
                filteredQuestions[randomQuestionIndex].answer;
          }

          i++;
          quizQuestions.add(BeginnerQuestion(
              filteredQuestions[randomQuestionIndex].question,
              answers,
              correctAnswerIndex));
        }
      }
    } else {
      for (int i = 0; i < filteredQuestions.length; i++) {
        BeginnerQuizQuestion question = filteredQuestions[i];
        List<String> answers = [];

        while (answers.length < 4) {
          int randomAnswerIndex = Random().nextInt(filteredQuestions.length);
          String randomAnswer = filteredQuestions[randomAnswerIndex].answer;
          if (!answers.contains(randomAnswer)) {
            answers.add(randomAnswer);
          }
        }

        int correctAnswerIndex;
        if (answers.contains(question.answer)) {
          correctAnswerIndex = answers.indexOf(question.answer);
        } else {
          correctAnswerIndex = Random().nextInt(4);
          answers[correctAnswerIndex] = question.answer;
        }

        quizQuestions.add(
          BeginnerQuestion(question.question, answers, correctAnswerIndex),
        );
      }
    }

    return quizQuestions;
  }

  Future<List<QuizQuestion>> createLearningQuiz(String topic) async {
    /*
    Utility utility = Utility();
    LocalRepository local = LocalRepository();
    RemoteSource remoteSource = RemoteSource();
    List<Word> allWords = [];
    List<CourseEntry> userLearned = await local
        .getUserLearnedWordiesByCurrentNativeLanguage()
        .then((value) => value.map((element) => element.toDomain()).toList());
    allWords = await remoteSource
        .getWordsByTopic(WordsByTopicModel(topic: topic))
        .then((value) => value!.wordList.map((e) => e.toDomain()).toList());

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
*/
    return [];
  }

  Future<List<QuizQuestion>> createReviewQuiz(String topic) async {
    /*
    Utility utility = Utility();
    

    Map<String, dynamic> map = await localRepository.getUserData();

    List<CourseEntry> learnedWords = await localRepository
        .getUserLearnedWordiesWithSpecificTopic(topic)
        .then((value) => value.map((e) => e.toDomain()).toList());

    List<QuizQuestion> questions =
        utility.createListOfQuestions(learnedWords, learnedWords);

    return questions;
*/
    return [];
  }
}
