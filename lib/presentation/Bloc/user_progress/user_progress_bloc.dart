import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wordy/data/local/local_repository_implementation.dart';
import 'package:wordy/domain/logic/settings_logic.dart';
import 'package:wordy/domain/models/course_basic.dart';
import 'package:wordy/shared/consts.dart';
import '../../../domain/logic/user_data_logic.dart';
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

      await userLogic.getFirstRun().then((value) async {
        if (!value) {
          emit(UserProgressLoaded(
              achievements: 0,
              daysStreak: await userLogic.getUserHotStreak(),
              finishedTopics: await userLogic.getFinishedTopicsCount(),
              learnedWords: await userLogic.getLearnedWordiesCount(),
              courses: await userLogic.getActiveCourses()));
        } else {
          emit(CreatingNewUserPreferences(
              userLanguageToLearn: '',
              userNativeLanguage: '',
              userLanguageToLearnSelected: false,
              userNativeLanguageSelected: false,
              step: 1));
        }
      });
    });
  }

  void updateUserCourse() {
    on<UpdateUserCourse>((event, emit) async {
      LocalRepository localRepository = LocalRepository();
      localRepository.updateUserProfile("currentCourse", event.course);
      Map<String, dynamic> userData = await localRepository.getUserData();
      String nativeLanguage = "";
      await localRepository.getUserData().then((value) {
        nativeLanguage = value['interfaceLanguage']!;
      });
      if (nativeLanguage == event.course) {
        String updatedNativeLanguage = "";
        if (nativeLanguage == "Polish") {
          updatedNativeLanguage = "English";
        } else {
          updatedNativeLanguage = "Polish";
        }
        localRepository.updateUserProfile(
            "interfaceLanguage", updatedNativeLanguage);
        emit(UserCoursesAndSettingsInformations(
            currentCourse: userData["courseName"]!,
            nativeLanguage: updatedNativeLanguage,
            hotStreak: userData['daysStreak']!,
            wordsLearnedToday: userData['wordsLearnedToday']!));
      } else {
        emit(UserCoursesAndSettingsInformations(
            currentCourse: userData["courseName"]!,
            nativeLanguage: userData["interfaceLanguage"]!,
            hotStreak: userData['daysStreak']!,
            wordsLearnedToday: userData['wordsLearnedToday']!));
      }
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
      UserDataLogic userLogic = UserDataLogic();

      await userLogic.updateDatabase('firstRun', "0");
    });
  }

  void loadUserData() {
    on<LoadUserDataAndPreferences>((event, emit) async {
      UserDataLogic userLogic = UserDataLogic();

      emit(UserProgressLoaded(
          achievements: 0,
          daysStreak: await userLogic.getUserHotStreak(),
          finishedTopics: await userLogic.getFinishedTopicsCount(),
          learnedWords: await userLogic.getLearnedWordiesCount(),
          courses: await userLogic.getActiveCourses()));
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
