part of 'user_progress_bloc.dart';

abstract class UserProgressEvent extends Equatable {
  const UserProgressEvent();

  @override
  List<Object> get props => [];
}

class LoadUserPreferencesOrCreateNewUser extends UserProgressEvent {
  LoadUserPreferencesOrCreateNewUser();
}

class LoadUserDataAndPreferences extends UserProgressEvent {
  LoadUserDataAndPreferences();
}

class LoadLearnedWords extends UserProgressEvent {
  LoadLearnedWords();
}

class LoadUserSettingsAndCourseInformations extends UserProgressEvent {
  LoadUserSettingsAndCourseInformations();
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
  LoadNewUserChoosingLanguageToLearn();
}

class LoadLearnedWorsdWithSpecificCourse extends UserProgressEvent {
  LoadLearnedWorsdWithSpecificCourse({required this.course});
  Course course;
}
