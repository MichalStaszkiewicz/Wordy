import 'dart:math';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wordy/Utility/utility.dart';
import 'package:wordy/models/quiz_question.dart';

import '../../models/word.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizInitial()) {
    learningWords();
    reviewWords();
    nextQuestion();
    selectAnswer();
  }
  void selectAnswer() {
    on<SelectAnswer>((event, emit) {
      if (state is QuizLoaded) {
        final state = this.state as QuizLoaded;
        int state_of_selected_ans = 0;
        List<int> modified_question_answer_state = [0, 0, 0, 0];
        if (event.index == state.questions[state.index].correct_answer_index) {
          modified_question_answer_state[event.index] = 1;
          state_of_selected_ans = 1;
        } else {
          modified_question_answer_state[
              state.questions[state.index].correct_answer_index] = 1;
          modified_question_answer_state[event.index] = 2;
        
        }
        emit(QuizLoaded(
          questions: state.questions,
          index: state.index,
          selected: true,
          question_answer_state: modified_question_answer_state,
          correct: state.correct + state_of_selected_ans,
        ));
      }
    });
  }

  void nextQuestion() {
    on<LoadNextQuestion>((event, emit) {
      if (state is QuizLoaded) {
        final state = this.state as QuizLoaded;
        emit(QuizLoaded(
          questions: state.questions,
          index: state.index + 1,
          selected: false,
          question_answer_state: [0, 0, 0, 0],
          correct: state.correct,
        ));
      }
    });
  }

  void learningWords() {
    on<LoadQuestionsForLearning>((event, emit) async {
      var settings = ConnectionSettings(
        host: '34.116.212.168',
        port: 3306,
        user: 'root',
        password: '1337',
        db: 'wordy-database',
      );
      var connection = await MySqlConnection.connect(settings);
      var results = await connection
          .query("SELECT * FROM translations WHERE Topic = ?", [event.topic]);

      List<Word> words = [];
      for (int i = 0; i < results.length; i++) {
        words.add(Word(
            polish: results.elementAt(i).fields['Polish'],
            english: results.elementAt(i).fields['English'],
            french: results.elementAt(i).fields['French'],
            spanish: results.elementAt(i).fields['Spanish']));
      }
      connection.close();
      String databasePath = await getDatabasesPath();
      String path = "$databasePath/wordyDB.db/";
      Database db = await openDatabase(path);
      Utility utility = Utility();

      List<QuizQuestion> questions = [];
      var profile = await db.rawQuery("SELECT currentCourse FROM profile");
      if (profile.isNotEmpty) {
        String currentCourse = profile.elementAt(0)['currentCourse'].toString();

        Map<String, String> map =
            utility.convertCurrentCourseName(currentCourse);
        String languageToLearn = map['languageToLearn'] ?? "";
        String languageThatUserWillLearnFrom =
            map['languageThatUserWillLearnFrom'] ?? "";

        var learnedWords =
            await db.rawQuery("SELECT * FROM ${map['courseNameTable']}");

        var random = new Random();
        for (int i = 0; i < words.length; i++) {
          if (questions.length == 20) {
            break;
          }
          if (languageToLearn.toLowerCase() == "english" &&
              languageThatUserWillLearnFrom.toLowerCase() == "polish") {
            var answers = Set<String>();
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
        }

        emit(QuizLoaded(
          questions: questions,
          index: 0,
          selected: false,
          question_answer_state: [0, 0, 0, 0],
          correct: 0,
        ));
      }
    });
  }

  void reviewWords() {
    on<LoadQuestionsForReview>((event, emit) async {
      var settings = ConnectionSettings(
        host: '34.116.212.168',
        port: 3306,
        user: 'root',
        password: '1337',
        db: 'wordy-database',
      );
      var connection = await MySqlConnection.connect(settings);
      var results = await connection
          .query("SELECT * FROM translations WHERE Topic = ${event.topic}");

      List<Word> words = [];
      for (int i = 0; i < results.length; i++) {
        words.add(Word(
            polish: results.elementAt(i).fields['Polish'],
            english: results.elementAt(i).fields['English'],
            french: results.elementAt(i).fields['French'],
            spanish: results.elementAt(i).fields['Spanish']));
      }
      connection.close();
      emit(QuizLoaded(
          questions: [],
          index: 0,
          selected: false,
          question_answer_state: [0, 0, 0, 0],
          correct: 0));
    });
  }
}
