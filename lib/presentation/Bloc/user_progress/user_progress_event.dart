part of 'user_progress_bloc.dart';

abstract class UserProgressEvent extends Equatable {
  const UserProgressEvent();

  @override
  List<Object> get props => [];
}
class LoadUserPreferencesOrCreateNewUser extends UserProgressEvent{
LoadUserPreferencesOrCreateNewUser();

}
class LoadUserDataAndPreferences extends UserProgressEvent {
  LoadUserDataAndPreferences();
}

class LoadLearnedWords extends UserProgressEvent {
  LoadLearnedWords();
}

class CreatingNewUserPreferencesUpdate extends UserProgressEvent{
CreatingNewUserPreferencesUpdate({required this.userLanguageToLearn,required this.userNativeLanguage});
String userNativeLanguage;
String userLanguageToLearn;

}

class CreateNewUser extends UserProgressEvent {
  CreateNewUser();
}

class LoadNewUserChoosingLanguageToLearn extends UserProgressEvent {
  LoadNewUserChoosingLanguageToLearn();
}

class LoadLearnedWorsdWithSpecificCourse extends UserProgressEvent {
  LoadLearnedWorsdWithSpecificCourse({required this.course});
  Course course;
}
