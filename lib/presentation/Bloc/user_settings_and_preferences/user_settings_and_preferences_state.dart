part of 'user_settings_and_preferences_bloc.dart';

abstract class UserSettingsAndPreferencesState extends Equatable {
  const UserSettingsAndPreferencesState();

  @override
  List<Object> get props => [];
}

class UserSettingsAndPreferencesInitial
    extends UserSettingsAndPreferencesState {
  UserSettingsAndPreferencesInitial();
  @override
  List<Object> get props => [];
}

class UserSettingsAndPreferencesLoaded extends UserSettingsAndPreferencesState {
  UserSettingsAndPreferencesLoaded();
  @override
  List<Object> get props => [];
}

class UserLearnedWordsLoaded extends UserSettingsAndPreferencesState {
  UserLearnedWordsLoaded({required this.courses});
  List<Course> courses;
  @override
  List<Object> get props => [courses];
}

class UserLearnedWordsSpecificCourse extends UserSettingsAndPreferencesState {
  UserLearnedWordsSpecificCourse({required this.course});
  Course course;
  @override
  List<Object> get props => [course];
}
