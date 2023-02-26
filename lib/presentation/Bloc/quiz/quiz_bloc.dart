import 'dart:math';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wordy/Utility/utility.dart';
import 'package:wordy/data/local/local_repository_implementation.dart';
import 'package:wordy/domain/models/course_entry.dart';

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
    updateLearnedWords();
  }
  void selectAnswer() {
    on<SelectAnswer>((event, emit) {
      if (state is LearningQuizLoaded) {
        final state = this.state as LearningQuizLoaded;

        List<CourseEntry> list = state.correct.toList();
        List<int> modifiedQuestionAnswerState = [0, 0, 0, 0];
        if (event.index == state.questions[state.index].correct_answer_index) {
          modifiedQuestionAnswerState[event.index] = 1;

          list.add(CourseEntry(
              translation: state.questions[state.index].answer,
              word: state.questions[state.index].question,
              topic: state.topic));
        } else {
          modifiedQuestionAnswerState[
              state.questions[state.index].correct_answer_index] = 1;
          modifiedQuestionAnswerState[event.index] = 2;
        }
        emit(LearningQuizLoaded(
          questions: state.questions,
          index: state.index,
          selected: true,
          question_answer_state: modifiedQuestionAnswerState,
          correct: list,
          topic: state.topic,
        ));
      }
    });
  }

  void nextQuestion() {
    on<LoadNextQuestion>((event, emit) {
      if (state is LearningQuizLoaded) {
        final state = this.state as LearningQuizLoaded;
        emit(LearningQuizLoaded(
          questions: state.questions,
          index: state.index + 1,
          selected: false,
          question_answer_state: const [0, 0, 0, 0],
          correct: state.correct,
          topic: state.topic,
        ));
      }
    });
  }

  void updateLearnedWords() {
    on<UpdateLearnedWords>((event, emit) {
      LocalRepository localRepository = LocalRepository();
      localRepository.insertLearnedWordsToDatabase(event.words);
      emit(QuizCompleted());
    });
  }

  void learningWords() {
    on<LoadQuestionsForLearning>((event, emit) async {
      QuizLogic logic = QuizLogic();
      List<QuizQuestion> questions =
          await logic.createLearningQuiz(event.topic);
      emit(LearningQuizLoaded(
          questions: questions,
          index: 0,
          selected: false,
          question_answer_state: const [0, 0, 0, 0],
          correct: const [],
          topic: event.topic));
    });
  }

  void reviewWords() {
    on<LoadQuestionsForReview>((event, emit) async {
      QuizLogic logic = QuizLogic();

      List<QuizQuestion> questions = await logic.createReviewQuiz(event.topic);
      emit(ReviewQuizLoaded(
          questions: questions,
          index: 0,
          selected: false,
          question_answer_state: const [0, 0, 0, 0],
          correct: const [],
          topic: event.topic));
    });
  }
}
