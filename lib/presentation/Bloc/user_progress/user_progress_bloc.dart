import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wordy/data/local/local_repository_implementation.dart';
import 'package:wordy/domain/logic/settings_logic.dart';
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
      await localRepository.getUserData().then((value) {
        currentCourse = value['courseName']!;
        nativeLanguage = value['interfaceLanguage']!;
      });

      emit(UserCoursesAndSettingsInformations(
          currentCourse: currentCourse, nativeLanguage: nativeLanguage));
    });
  }

  void loadUserPreferencesOrCreateNewUser() {
    on<LoadUserPreferencesOrCreateNewUser>((event, emit) async {
      UserDataLogic userLogic = UserDataLogic();
      SettingsLogic settingsLogic = SettingsLogic();
      await userLogic.getFirstRun().then((value) async {
        print("User first run in bloc: " + value.toString());
        if (!value) {
          userLanguage = await settingsLogic.getUserInterfaceLanguage();
          emit(UserProgressLoaded(
              achievements: 0,
              daysStreak: 0,
              finishedTopics: await userLogic.getFinishedTopicsCount(),
              learnedWords: await userLogic.getLearnedWordiesCount()));
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
      Map<String, String> userData = await localRepository.getUserData();
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
            nativeLanguage: updatedNativeLanguage));
      } else {
        emit(UserCoursesAndSettingsInformations(
            currentCourse: userData["courseName"]!,
            nativeLanguage: userData["interfaceLanguage"]!));
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
          daysStreak: 0,
          finishedTopics: await userLogic.getFinishedTopicsCount(),
          learnedWords: await userLogic.getLearnedWordiesCount()));
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
      emit(UserLearnedWordsSpecificCourse(course: event.course));
    });
  }
}
