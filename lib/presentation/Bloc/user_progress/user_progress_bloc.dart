import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wordy/domain/logic/user_service.dart';
import 'package:wordy/domain/models/course_basic.dart';

import '../../../Utility/locator/service_locator.dart';

import '../../../domain/models/achievement.dart';
import '../../../domain/models/course.dart';

part 'user_progress_event.dart';
part 'user_progress_state.dart';

class UserProgressBloc extends Bloc<UserProgressEvent, UserProgressState> {
  UserProgressBloc() : super(const UserProgressInitial()) {
    loadUserData();
    loadLearnedWords();
    loadLearnedWordsByCourse();
    createNewUser();
    updateCreateNewUser();
    loadUserPreferencesOrCreateNewUser();
    loadUserSettingsAndCourseInformations();
    updateUserCourse();
  }

  void loadUserSettingsAndCourseInformations() {
    on<LoadUserSettingsAndCourseInformations>((event, emit) async {
      String currentCourse = "";
      String nativeLanguage = "";
      String hotStreak = "";
      String wordsLearnedToday = "";

      emit(UserCoursesAndSettingsInformations(
          currentCourse: currentCourse,
          nativeLanguage: nativeLanguage,
          hotStreak: hotStreak,
          wordsLearnedToday: wordsLearnedToday));
    });
  }

  void loadUserPreferencesOrCreateNewUser() {
    on<LoadUserPreferencesOrCreateNewUser>((event, emit) async {
      // List<Achievement> achievements = await userLogic.getUserAchievements(1);
      emit(UserProgressLoaded(
          achievements: 1,
          daysStreak: 3,
          finishedTopics: 3,
          learnedWords: 412,
          courses: const [],
          userAchievements: const [],
          allAchievements: const [],
          userAchievementsNonAchieved: const []));
    });
  }

  void updateUserCourse() {
    on<UpdateUserCourse>((event, emit) async {
      //implement logic
    });
  }

  void updateCreateNewUser() {
    on<CreatingNewUserPreferencesUpdate>((event, emit) {
      emit(CreatingNewUserPreferences(
          userLanguageToLearn: event.userLanguageToLearn,
          userNativeLanguage: event.userNativeLanguage,
          userLanguageToLearnSelected: event.userLanguageToLearnSelected,
          userNativeLanguageSelected: event.userNativeLanguageSelected,
          step: event.step));
    });
  }

  void createNewUser() {
    on<CreateNewUser>((event, emit) async {
      //implement logic
    });
  }

  void loadUserData() {
    on<LoadUserDataAndPreferences>((event, emit) async {
      final userLogic = locator<UserService>();
      List<Achievement> achievements = [];
      emit(UserProgressLoaded(
          achievements: achievements.length,
          daysStreak: 0,
          finishedTopics: 0,
          learnedWords: 0,
          courses: const [],
          userAchievements: achievements,
          allAchievements: const [],
          userAchievementsNonAchieved: const []));
    });
  }

  void loadLearnedWords() {
    on<LoadLearnedWords>((event, emit) async {
      final userLogic = locator<UserService>();
      emit(UserLearnedWordsLoaded(courses: const []));
    });
  }

  void loadLearnedWordsByCourse() {
    on<LoadLearnedWorsdWithSpecificCourse>((event, emit) {
      emit(UserLearnedWordsSpecificTopic(course: event.course));
    });
  }
}
