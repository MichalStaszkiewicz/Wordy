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
      required this.finishedTopics,
      required this.courses,
      required this.userAchievements,
      required this.allAchievements});
  int learnedWords;
  int daysStreak;
  int finishedTopics;
  int achievements;
  List<Achievement> userAchievements;
  List<AchievementBase> allAchievements;
  List<CourseBasic> courses;
  @override
  List<Object> get props => [
        learnedWords,
        daysStreak,
        finishedTopics,
        achievements,
        courses,
        userAchievements,
        allAchievements
      ];
}

class UserCoursesAndSettingsInformations extends UserProgressState {
  UserCoursesAndSettingsInformations(
      {required this.currentCourse,
      required this.nativeLanguage,
      required this.hotStreak,
      required this.wordsLearnedToday});
  String hotStreak;
  String wordsLearnedToday;
  String currentCourse;
  String nativeLanguage;

  @override
  List<Object> get props =>
      [currentCourse, hotStreak, wordsLearnedToday, nativeLanguage];
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

class UserLearnedWordsSpecificTopic extends UserProgressState {
  UserLearnedWordsSpecificTopic({required this.course});
  Course course;
  @override
  List<Object> get props => [course];
}
