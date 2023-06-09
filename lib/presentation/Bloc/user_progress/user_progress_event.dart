part of 'user_progress_bloc.dart';

abstract class UserProgressEvent extends Equatable {
  const UserProgressEvent();

  @override
  List<Object> get props => [];
}

class LoadUserPreferencesOrCreateNewUser extends UserProgressEvent {
  const LoadUserPreferencesOrCreateNewUser();
}

class LoadUserDataAndPreferences extends UserProgressEvent {
  const LoadUserDataAndPreferences();
}

class LoadLearnedWords extends UserProgressEvent {
  const LoadLearnedWords();
}

class LoadUserSettingsAndCourseInformations extends UserProgressEvent {
  const LoadUserSettingsAndCourseInformations();
}

class UpdateUserCourse extends UserProgressEvent {
  UpdateUserCourse({required this.course});
  String course;
}



class CreatingNewUserPreferencesUpdate extends UserProgressEvent {
  CreatingNewUserPreferencesUpdate(
      {required this.userLanguageToLearn,
      required this.userNativeLanguage,
      required this.userLanguageToLearnSelected,
      required this.userNativeLanguageSelected,
      required this.step});
  String userNativeLanguage;
  String userLanguageToLearn;
  bool userNativeLanguageSelected;
  bool userLanguageToLearnSelected;
  int step;
}

class CreateNewUser extends UserProgressEvent {
  CreateNewUser({required this.languageToLearn, required this.nativeLanguage});
  String languageToLearn;
  String nativeLanguage;
}

class LoadNewUserChoosingLanguageToLearn extends UserProgressEvent {
  const LoadNewUserChoosingLanguageToLearn();
}

class LoadLearnedWorsdWithSpecificCourse extends UserProgressEvent {
  LoadLearnedWorsdWithSpecificCourse({required this.course});
  Course course;
}
