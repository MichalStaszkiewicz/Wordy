import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wordy/data/local/local_repository_implementation.dart';
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
    createNewUserAndLoadData();
    updateCreateNewuser();
  }

  void updateCreateNewuser() {
    on<CreatingNewUserPreferencesUpdate>((event, emit) {
      
      emit(CreatingNewUserPreferences(userLanguageToLearn: event.userLanguageToLearn, userNativeLanguage: event.userNativeLanguage
       ));
    });
  }

  void createNewUserAndLoadData() {
    on<CreateNewUserAndLoadData>((event, emit) async {
      UserDataLogic userLogic = UserDataLogic();
      LocalRepository localRepository = LocalRepository();
      await localRepository.createDatabase();

      emit(UserProgressLoaded(
          achievements: 0,
          daysStreak: 0,
          finishedTopics: await userLogic.getFinishedTopicsCount(),
          learnedWords: await userLogic.getLearnedWordiesCount()));
    });
  }

  void loadUserData() {
    on<LoadUserDataAndPreferences>((event, emit) async {
      LocalRepository localRepository = LocalRepository();
      UserDataLogic userLogic = UserDataLogic();
      bool databaseExists = await localRepository.setupDatabase();
      if (databaseExists) {
        emit(UserProgressLoaded(
            achievements: 0,
            daysStreak: 0,
            finishedTopics: await userLogic.getFinishedTopicsCount(),
            learnedWords: await userLogic.getLearnedWordiesCount()));
      } else {
        emit(CreatingNewUserPreferences(userLanguageToLearn: '', userNativeLanguage: ''
    
        ));
      }
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
