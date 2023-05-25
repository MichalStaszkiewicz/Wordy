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
import '../../../domain/logic/user_data_logic.dart';
import '../../../domain/models/achievement.dart';
import '../../../domain/models/achievement_old.dart';
import '../../../domain/models/quiz_question.dart';
import '../../../domain/models/word.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizInitial()) {
    nextQuestion();
    selectAnswer();
    sessionCompleted();
  }

  void selectAnswer() {
    on<SelectAnswer>((event, emit) {});
  }

  void nextQuestion() {
    on<LoadNextQuestion>((event, emit) {});
  }

  void sessionCompleted() {
    on<SessionCompleted>((event, emit) async {});
  }
}
