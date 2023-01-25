import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wordy/Utility/utility.dart';

import '../../../data/local/local_database.dart';

part 'user_settings_and_preferences_event.dart';
part 'user_settings_and_preferences_state.dart';

class UserSettingsAndPreferencesBloc extends Bloc<
    UserSettingsAndPreferencesEvent, UserSettingsAndPreferencesState> {
  UserSettingsAndPreferencesBloc()
      : super(UserSettingsAndPreferencesInitial()) {
    loadUserData();
  }
  void loadUserData() {
    on<LoadUserDataAndPreferences>((event, emit) {
      LocalDatabase localDB = LocalDatabase();
      localDB.setupDatabase();
      emit(UserSettingsAndPreferencesLoaded());
    });
  }
}
