part of 'user_settings_and_preferences_bloc.dart';

abstract class UserSettingsAndPreferencesState extends Equatable {
  const UserSettingsAndPreferencesState();

  @override
  List<Object> get props => [];
}

class UserSettingsAndPreferencesInitial
    extends UserSettingsAndPreferencesState {}

class UserSettingsAndPreferencesLoaded extends UserSettingsAndPreferencesState {
}
