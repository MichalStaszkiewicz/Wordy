import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wordy/Utility/utility.dart';
import 'package:wordy/data/local/local_repository_implementation.dart';

import '../../../data/local/local_database.dart';

part 'user_settings_and_preferences_event.dart';
part 'user_settings_and_preferences_state.dart';

class UserSettingsAndPreferencesBloc extends Bloc<
    UserSettingsAndPreferencesEvent, UserSettingsAndPreferencesState> {
  UserSettingsAndPreferencesBloc()
      : super(UserSettingsAndPreferencesInitial()) {
    loadUserData();
    updateUserLearnedWords();
  }
  void loadUserData() {
    on<LoadUserDataAndPreferences>((event, emit) {
      LocalRepository localRepository = LocalRepository();
      localRepository.setupDatabase();
      emit(UserSettingsAndPreferencesLoaded());
    });
  }
  void updateUserLearnedWords(){
on<UpdateLearnedWords>((event, emit) {



});

    
  }
}
