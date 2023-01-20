import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wordy/Utility/utility.dart';

part 'user_settings_and_preferences_event.dart';
part 'user_settings_and_preferences_state.dart';

class UserSettingsAndPreferencesBloc extends Bloc<
    UserSettingsAndPreferencesEvent, UserSettingsAndPreferencesState> {
  UserSettingsAndPreferencesBloc()
      : super(UserSettingsAndPreferencesInitial()) {
    loadUserData();
  }

  void loadUserData() {
    on<LoadUserDataAndPreferences>((event, emit) async {
      String databasePath = await getDatabasesPath();
      String path = "$databasePath/wordyDB.db/";
      print("EXECUTED");
      Utility utility = Utility();
      bool exists = await databaseExists(path);
      if (!exists) {
        utility.createDatabase();
        print("Creating Database...");
        emit(UserSettingsAndPreferencesLoaded());
      } else {
        Database db = await openDatabase(path);

        var currentCourse = await db.rawQuery("SELECT * FROM profile");
        print("CURRENT COURSE " + currentCourse.length.toString());
        print("Database already exists at " + path + " + loading user data...");
        emit(UserSettingsAndPreferencesLoaded());
      }
    });
  }
}
