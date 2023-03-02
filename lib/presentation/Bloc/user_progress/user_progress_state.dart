part of 'user_progress_bloc.dart';

abstract class UserProgressState extends Equatable {
  const UserProgressState();

  @override
  List<Object> get props => [];
}

class UserProgressInitial extends UserProgressState {
  UserProgressInitial();
  @override
  List<Object> get props => [];
}

class UserProgressLoaded extends UserProgressState {
  UserProgressLoaded(
      {required this.learnedWords,
      required this.achievements,
      required this.daysStreak,
      required this.finishedTopics,required this.courses});
  int learnedWords;
  int daysStreak;
  int finishedTopics;
  int achievements;
  List<CourseBasic> courses;
  @override
  List<Object> get props =>
      [learnedWords, daysStreak, finishedTopics, achievements];
}

class UserCoursesAndSettingsInformations extends UserProgressState {
  UserCoursesAndSettingsInformations({required this.currentCourse,required this.nativeLanguage});

  String currentCourse;
  String nativeLanguage;

  @override
  List<Object> get props => [currentCourse];
}
class LanguageConflict extends UserProgressState {
LanguageConflict();

}
class NewUserCreating extends UserProgressState {
  NewUserCreating();
}

class CreatingNewUserPreferences extends UserProgressState {
  CreatingNewUserPreferences(
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
  @override
  List<Object> get props => [
        userLanguageToLearn,
        userNativeLanguage,
        userNativeLanguageSelected,
        userLanguageToLearnSelected,
        step
      ];
}

class UserLearnedWordsLoaded extends UserProgressState {
  UserLearnedWordsLoaded({required this.courses});
  List<Course> courses;
  @override
  List<Object> get props => [courses];
}

class UserLearnedWordsSpecificCourse extends UserProgressState {
  UserLearnedWordsSpecificCourse({required this.course});
  Course course;
  @override
  List<Object> get props => [course];
}
