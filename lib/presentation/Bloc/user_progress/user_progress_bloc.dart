import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wordy/data/local/local_repository_implementation.dart';

import '../../../domain/logic/user_preferences_logic.dart';
import '../../../domain/models/course.dart';

part 'user_progress_event.dart';
part 'user_progress_state.dart';

class UserProgressBloc extends Bloc<
    UserProgressEvent, UserProgressState> {
  UserProgressBloc()
      : super(UserProgressInitial()) {
    loadUserData();
    loadLearnedWords();
    loadLearnedWordsByCourse();
    
  }
  void loadUserData() {
    on<LoadUserDataAndPreferences>((event, emit) async {
      LocalRepository localRepository = LocalRepository();
      UserPreferencesLogic userLogic = UserPreferencesLogic();
      localRepository.setupDatabase();
       emit(UserProgressLoaded(
          achievements: 0,
          daysStreak: 0,
          finishedTopics: await userLogic.getFinishedTopicsCount(),
          learnedWords: await userLogic.getLearnedWordiesCount()));
    });
  }

  void loadLearnedWords() {
    on<LoadLearnedWords>((event, emit) async {
      UserPreferencesLogic userLogic = UserPreferencesLogic();
      emit(UserLearnedWordsLoaded(courses: await userLogic.getCoursesData()));
    });
  }

  void loadLearnedWordsByCourse() {
    on<LoadLearnedWorsdWithSpecificCourse>((event, emit) {
      emit(UserLearnedWordsSpecificCourse(course: event.course));
    });
  }

 
}
