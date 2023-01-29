part of 'user_settings_and_preferences_bloc.dart';

abstract class UserSettingsAndPreferencesEvent extends Equatable {
  const UserSettingsAndPreferencesEvent();

  @override
  List<Object> get props => [];
}

class LoadUserDataAndPreferences extends UserSettingsAndPreferencesEvent {
  LoadUserDataAndPreferences();
}

class LoadLearnedWords extends UserSettingsAndPreferencesEvent {
  LoadLearnedWords();
}

class LoadLearnedWorsdWithSpecificCourse
    extends UserSettingsAndPreferencesEvent {
  LoadLearnedWorsdWithSpecificCourse({required this.course});
  Course course;
}
