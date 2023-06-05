import 'dart:math';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wordy/Utility/utility.dart';
import 'package:wordy/domain/models/course_entry.dart';
import 'package:wordy/domain/models/custom_error.dart';

import '../../../data/network/exceptions/exception_helper.dart';
import '../../../domain/logic/quiz_logic.dart';
import '../../../domain/models/achievement.dart';
import '../../../domain/models/achievement_old.dart';
import '../../../domain/models/beginner_question.dart';
import '../../../domain/models/quiz_question.dart';
import '../../../domain/models/word.dart';
import '../../../utility/locator/api_locator.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizInitial()) {
    loadBeginnerQuiz();
    loadNextQuestion();
    finishQuiz();
    selectAnswer();
  }
  void loadBeginnerQuiz() {
    on<LoadBeginnerQuiz>((event, emit) async {
      final quizLogic = locator<QuizLogic>();
      emit(InProgress());
      var questions = await quizLogic.createBeginnerQuiz(event.topic);
      if (questions.isRight) {
        emit(BeginnerQuizLoaded(
            questions: questions.right!,
            currentQuestionIndex: 0,
            selectedIndex: null,
            correctAnswersWordIndexes: []));
      } else {
        emit(
            QuizError(error: ExceptionHelper.getErrorMessage(questions.left!)));
      }
    });
  }

  void selectAnswer() {
    on<SelectAnswer>((event, emit) {
      final state = this.state as BeginnerQuizLoaded;
      List<int> correctIndexes = state.correctAnswersWordIndexes;
      if (state.questions[state.currentQuestionIndex].correctAnswerIndex ==
          event.selectedIndex) {
        correctIndexes.add(state.questions[state.currentQuestionIndex].wordId);
      }
      emit(BeginnerQuizLoaded(
          questions: state.questions,
          currentQuestionIndex: state.currentQuestionIndex,
          selectedIndex: event.selectedIndex,
          correctAnswersWordIndexes: correctIndexes));
    });
  }

  void loadNextQuestion() {
    on<LoadNextQuestion>((event, emit) {
      final state = this.state as BeginnerQuizLoaded;
      emit(BeginnerQuizLoaded(
          questions: state.questions,
          currentQuestionIndex: state.currentQuestionIndex + 1,
          correctAnswersWordIndexes: state.correctAnswersWordIndexes,
          selectedIndex: null));
    });
  }

  void finishQuiz() {
    on<FinishQuiz>((event, emit) async {
      final quizLogic = locator<QuizLogic>();

      await quizLogic.insertLearnedWords(event.wordIds);
    });
  }
}
