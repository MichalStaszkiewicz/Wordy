part of 'user_settings_and_preferences_bloc.dart';

abstract class UserSettingsAndPreferencesEvent extends Equatable {
  const UserSettingsAndPreferencesEvent();

  @override
  List<Object> get props => [];
}

class LoadUserDataAndPreferences extends UserSettingsAndPreferencesEvent {
  LoadUserDataAndPreferences();
}

class UpdateLearnedWords extends UserSettingsAndPreferencesEvent {
  UpdateLearnedWords({required this.words});
  List<String> words;
  @override
  List<Object> get props => [];
}
