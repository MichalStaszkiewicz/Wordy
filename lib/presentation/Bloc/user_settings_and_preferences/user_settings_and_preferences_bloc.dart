import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wordy/Utility/utility.dart';
import 'package:wordy/data/local/local_repository_implementation.dart';

import '../../../data/local/local_database.dart';
import '../../../domain/logic/user_preferences_logic.dart';
import '../../../domain/models/course.dart';
import '../../../domain/models/course_entry.dart';

part 'user_settings_and_preferences_event.dart';
part 'user_settings_and_preferences_state.dart';

class UserSettingsAndPreferencesBloc extends Bloc<
    UserSettingsAndPreferencesEvent, UserSettingsAndPreferencesState> {
  UserSettingsAndPreferencesBloc()
      : super(UserSettingsAndPreferencesInitial()) {
    loadUserData();
    loadLearnedWords();
    loadLearnedWordsByCourse();
  }
  void loadUserData() {
    on<LoadUserDataAndPreferences>((event, emit) {
      LocalRepository localRepository = LocalRepository();
      localRepository.setupDatabase();
      emit(UserSettingsAndPreferencesLoaded());
    });
  }

  void loadLearnedWords() {
    on<LoadLearnedWords>((event, emit) async {
      UserPreferencesLogic userLogic = UserPreferencesLogic();
      emit(UserLearnedWordsLoaded(courses: await userLogic.getCoursesData()));
    });
  }

  void loadLearnedWordsByCourse() {
    on<LoadLearnedWorsdWithSpecificCourse>((event, emit) {
      emit(UserLearnedWordsSpecificCourse(course: event.course));
    });
  }
}
