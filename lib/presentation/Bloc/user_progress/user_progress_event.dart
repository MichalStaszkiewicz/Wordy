part of 'user_progress_bloc.dart';

abstract class UserProgressEvent extends Equatable {
  const UserProgressEvent();

  @override
  List<Object> get props => [];
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

class CreateNewUserAndLoadData extends UserProgressEvent {
  CreateNewUserAndLoadData();
}

class LoadNewUserChoosingLanguageToLearn extends UserProgressEvent {
  LoadNewUserChoosingLanguageToLearn();
}

class LoadLearnedWorsdWithSpecificCourse extends UserProgressEvent {
  LoadLearnedWorsdWithSpecificCourse({required this.course});
  Course course;
}
