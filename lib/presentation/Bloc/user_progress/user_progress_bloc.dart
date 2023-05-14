import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wordy/Utility/c_achievment.dart';
import 'package:wordy/data/local/local_repository_implementation.dart';
import 'package:wordy/domain/logic/settings_logic.dart';
import 'package:wordy/domain/models/course_basic.dart';
import 'package:wordy/const/consts.dart';
import '../../../Utility/utility.dart';
import '../../../domain/logic/user_data_logic.dart';
import '../../../domain/models/achievement.dart';
import '../../../domain/models/achievement_old.dart';
import '../../../domain/models/achievements_base.dart';
import '../../../domain/models/course.dart';
part 'user_progress_event.dart';
part 'user_progress_state.dart';

class UserProgressBloc extends Bloc<UserProgressEvent, UserProgressState> {
  UserProgressBloc() : super(UserProgressInitial()) {
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
      LocalRepository localRepository = LocalRepository();
      String currentCourse = "";
      String nativeLanguage = "";
      String hotStreak = "";
      String wordsLearnedToday = "";
      await localRepository.getUserData().then((userDate) {
        currentCourse = userDate['courseName']!;
        nativeLanguage = userDate['interfaceLanguage']!;
        hotStreak = userDate['daysStreak']!;
        wordsLearnedToday = userDate['wordsLearnedToday']!;
      });

      emit(UserCoursesAndSettingsInformations(
          currentCourse: currentCourse,
          nativeLanguage: nativeLanguage,
          hotStreak: hotStreak,
          wordsLearnedToday: wordsLearnedToday));
    });
  }

  void loadUserPreferencesOrCreateNewUser() {
    on<LoadUserPreferencesOrCreateNewUser>((event, emit) async {
      UserDataLogic userLogic = UserDataLogic();

      // List<Achievement> achievements = await userLogic.getUserAchievements(1);
      emit(UserProgressLoaded(
          achievements: 1,
          daysStreak: 3,
          finishedTopics: 3,
          learnedWords: 412,
          courses: [],
          userAchievements: [],
          allAchievements: [],
          userAchievementsNonAchieved: []));
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
      UserDataLogic userLogic = UserDataLogic();
      List<Achievement> achievements = await userLogic.getUserAchievements(1);
      emit(UserProgressLoaded(
          achievements: achievements.length,
          daysStreak: await userLogic.getUserHotStreak(),
          finishedTopics: await userLogic.getFinishedTopicsCount(),
          learnedWords: await userLogic.getLearnedWordiesCount(),
          courses: await userLogic.getActiveCourses(),
          userAchievements: achievements,
          allAchievements: await userLogic.getAllAchievements(),
          userAchievementsNonAchieved:
              await userLogic.getNonAchievedAchievements()));
    });
  }

  void loadLearnedWords() {
    on<LoadLearnedWords>((event, emit) async {
      UserDataLogic userLogic = UserDataLogic();
      emit(UserLearnedWordsLoaded(courses: await userLogic.getCoursesData()));
    });
  }

  void loadLearnedWordsByCourse() {
    on<LoadLearnedWorsdWithSpecificCourse>((event, emit) {
      emit(UserLearnedWordsSpecificTopic(course: event.course));
    });
  }
}
