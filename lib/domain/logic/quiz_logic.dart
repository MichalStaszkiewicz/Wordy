import 'dart:math';

import 'package:wordy/domain/logic/user_service.dart';
import 'package:wordy/domain/repositiories/repository.dart';
import 'package:wordy/utility/either.dart';


import '../models/vocabulary_question.dart';
import '../models/word.dart';

class QuizLogic {
  final Repository _repository;
  final UserService _userService;

  QuizLogic(this._repository, this._userService);

  Future<Either<Exception, String>> insertLearnedWords(
      List<int> wordIds) async {
    final token = await _userService.getTokenAccess();
    if (token.isData) {
      var insertedWords =
          await _repository.insertLearnedWordList(wordIds, token.data!);
      if (insertedWords.isData) {
        return Either.data(insertedWords.data);
      } else {
        return Either.error(insertedWords.error);
      }
    } else {
      return Either.error(token.error);
    }
  }

  Future<Either<Exception, List<VocabularyQuestion>>> createLearningQuiz(
      String topic) async {
    List<VocabularyQuestion> quizQuestions = [];
    final token = await _userService.getTokenAccess();
    if (token.isError) {
      return Either.error(token.error);
    }
    final userInterfaceLanguage = await _repository.getUserInterfaceLanguage();
    if (userInterfaceLanguage.isError) {
      return Either.error(userInterfaceLanguage.error);
    }
    var course = await _repository.getUserCurrentCourse(token.data!);

    if (course.isError) {
      return Either.error(course.error!);
    }

    var learnedWords = await _repository.getLearnedWordList(token.data!);
    if (learnedWords.isError) {
      return Either.error(learnedWords.error!);
    }

    var questions =
        await _repository.getBeginnerQuizWordList(topic, token.data!);
    if (questions.isError) {
      return Either.error(questions.error!);
    }
    List<Word> validatedQuestions = questions.data!;
    List<Word> validatedLearnedWords = learnedWords.data!;
    List<String> possibleAnswers = [];

    List<Word> filteredQuestions = [];

    for (Word question in validatedQuestions) {
      if (!validatedLearnedWords.contains(Word(
          question: question.question,
          answer: question.answer,
          wordId: question.wordId))) {
        filteredQuestions.add(question);
      }
    }

    for (Word question in validatedQuestions) {
      possibleAnswers.add(question.answer);
    }
    if (filteredQuestions.length >= 10) {
      for (int i = 0; i < 10;) {
        Random random = Random();

        List<String> answers = [];
        int correctAnswerIndex = 0;

        while (answers.length < 4) {
          int randomAnswerIndex = random.nextInt(validatedQuestions.length);
          if (!answers.contains(validatedQuestions[randomAnswerIndex].answer)) {
            answers.add(validatedQuestions[randomAnswerIndex].answer);
          }
        }
        if (answers.contains(filteredQuestions[i].answer)) {
          correctAnswerIndex = answers
              .indexWhere((element) => element == filteredQuestions[i].answer);
        } else {
          correctAnswerIndex = random.nextInt(3);
          answers[correctAnswerIndex] = filteredQuestions[i].answer;
        }
        quizQuestions.add(VocabularyQuestion(
            question: filteredQuestions[i].question,
            answers: answers,
            correctAnswerIndex: correctAnswerIndex,
            wordId: filteredQuestions[i].wordId));
        i++;
      }
    } else {
      for (int i = 0; i < filteredQuestions.length; i++) {
        Word question = filteredQuestions[i];
        List<String> answers = [];

        while (answers.length < 4) {
          int randomAnswerIndex = Random().nextInt(validatedQuestions.length);
          String randomAnswer = validatedQuestions[randomAnswerIndex].answer;
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
          VocabularyQuestion(
              question: question.question,
              answers: answers,
              correctAnswerIndex: correctAnswerIndex,
              wordId: question.wordId),
        );
      }
    }

    return Either.data(quizQuestions);
  }

  Future<Either<Exception, List<VocabularyQuestion>>> createReviewQuiz(
      String topic) async {
    List<VocabularyQuestion> quizQuestions = [];
    final token = await _userService.getTokenAccess();
    if (token.isError) {
      return Either.error(token.error);
    }
    final userInterfaceLanguage = await _repository.getUserInterfaceLanguage();
    if (userInterfaceLanguage.isError) {
      return Either.error(userInterfaceLanguage.error);
    }
    var course = await _repository.getUserCurrentCourse(token.data!);

    if (course.isError) {
      return Either.error(course.error!);
    }

    var questions =
        await _repository.getBeginnerQuizWordList(topic, token.data!);
    if (questions.isError) {
      return Either.error(questions.error!);
    }

    List<String> possibleAnswers = [];

    for (Word question in questions.data!) {
      possibleAnswers.add(question.answer);
    }

    if (questions.data!.length >= 10) {
      for (int i = 0; i < 10;) {
        Random random = Random();

        List<String> answers = [];
        int correctAnswerIndex = 0;

        while (answers.length < 4) {
          int randomAnswerIndex = random.nextInt(questions.data!.length);
          if (!answers.contains(questions.data![randomAnswerIndex].answer)) {
            answers.add(questions.data![randomAnswerIndex].answer);
          }
        }
        if (answers.contains(questions.data![i].answer)) {
          correctAnswerIndex = answers
              .indexWhere((element) => element == questions.data![i].answer);
        } else {
          correctAnswerIndex = random.nextInt(3);
          answers[correctAnswerIndex] = questions.data![i].answer;
        }
        quizQuestions.add(VocabularyQuestion(
            question: questions.data![i].question,
            answers: answers,
            correctAnswerIndex: correctAnswerIndex,
            wordId: questions.data![i].wordId));
        i++;
      }
    } else {
      for (int i = 0; i < questions.data!.length; i++) {
        Word question = questions.data![i];
        List<String> answers = [];

        while (answers.length < 4) {
          int randomAnswerIndex = Random().nextInt(questions.data!.length);
          String randomAnswer = questions.data![randomAnswerIndex].answer;
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
          VocabularyQuestion(
              question: question.question,
              answers: answers,
              correctAnswerIndex: correctAnswerIndex,
              wordId: question.wordId),
        );
      }
    }

    return Either.data(quizQuestions);
  }
}
