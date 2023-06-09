import 'dart:math';

import 'package:wordy/data/network/request/models/begginer_quiz_request_model.dart';
import 'package:wordy/domain/models/quiz_question.dart';
import 'package:wordy/domain/repositiories/repository.dart';
import 'package:wordy/domain/repositiories/user_repository.dart';
import 'package:wordy/utility/either.dart';

import '../../data/network/request/models/insert_learned_words.request.model.dart';
import '../models/beginner_question.dart';
import '../models/beginner_quiz_question.dart';
import '../models/learned_word.dart';

class QuizLogic {
  final Repository _repository;
  final UserRepository _userRepository;
  QuizLogic(this._repository, this._userRepository);

  Future<Either<Exception, String>> insertLearnedWords(
      List<int> wordIds) async {
    final userId = await _repository.getUserId();
    if (userId.isRight) {
      var insertedWords = await _repository.insertLearnedWordList(
          InsertLearnedWordsModel(userId: userId.right!, wordIdList: wordIds));
      if (insertedWords.isRight) {
        return Either.right(insertedWords.right);
      } else {
        return Either.left(insertedWords.left!);
      }
    } else {
      return Either.left(userId.left);
    }
  }

  Future<Either<Exception, List<BeginnerQuestion>>> createBeginnerQuiz(
      String topic) async {
    List<BeginnerQuestion> quizQuestions = [];
    final userId = await _userRepository.getUserId();
    if (userId.isLeft) {
      return Either.left(userId.left);
    }
    final userInterfaceLanguage = await _repository.getUserInterfaceLanguage();
    if (userInterfaceLanguage.isLeft) {
      return Either.left(userInterfaceLanguage.left);
    }
    var course = await _repository.getUserCurrentCourse(userId.right!);

    if (course.isLeft) {
      return Either.left(course.left!);
    }

    var learnedWords = await _repository.getLearnedWordList(userId.right!);
    if (learnedWords.isLeft) {
      return Either.left(learnedWords.left!);
    }

    var questions = await _repository.getBeginnerQuizWordList(BeginnerQuizModel(
        topic: topic,
        interfaceLanguage: userInterfaceLanguage.right!,
        userId: userId.right!));
    if (questions.isLeft) {
      return Either.left(questions.left!);
    }
    List<BeginnerQuizQuestion> validatedQuestions = questions.right!;
    List<LearnedWord> validatedLearnedWords = learnedWords.right!;
    List<String> possibleAnswers = [];

    List<BeginnerQuizQuestion> filteredQuestions = [];

    for (BeginnerQuizQuestion question in validatedQuestions) {
      if (!validatedLearnedWords.contains(LearnedWord(
          question: question.question,
          answer: question.answer,
          wordId: question.wordId))) {
        filteredQuestions.add(question);
      }
    }

    for (BeginnerQuizQuestion question in validatedQuestions) {
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
        quizQuestions.add(BeginnerQuestion(filteredQuestions[i].question,
            answers, correctAnswerIndex, filteredQuestions[i].wordId));
        i++;
      }
    } else {
      for (int i = 0; i < filteredQuestions.length; i++) {
        BeginnerQuizQuestion question = filteredQuestions[i];
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
          BeginnerQuestion(
              question.question, answers, correctAnswerIndex, question.wordId),
        );
      }
    }

    return Either.right(quizQuestions);
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
