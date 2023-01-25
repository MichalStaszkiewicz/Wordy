import 'dart:math';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wordy/Utility/utility.dart';

import '../../../domain/logic/quiz_logic.dart';
import '../../../domain/models/quiz_question.dart';
import '../../../domain/models/word.dart';

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

        List<String> list = state.correct.toList();
        List<int> modified_question_answer_state = [0, 0, 0, 0];
        if (event.index == state.questions[state.index].correct_answer_index) {
          modified_question_answer_state[event.index] = 1;

          list.add(state.questions[state.index].question);
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
          correct: list,
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
      QuizLogic logic = QuizLogic();
      List<QuizQuestion> questions =
          await logic.createLearningQuiz(event.topic);
      emit(QuizLoaded(
          questions: questions,
          index: 0,
          selected: false,
          question_answer_state: [0, 0, 0, 0],
          correct: []));
    });
  }

  void reviewWords() {
    on<LoadQuestionsForReview>((event, emit) async {
      QuizLogic logic = QuizLogic();

      List<QuizQuestion> questions = await logic.createReviewQuiz(event.topic);
      emit(QuizLoaded(
          questions: questions,
          index: 0,
          selected: false,
          question_answer_state: [0, 0, 0, 0],
          correct: []));
    });
  }
}
