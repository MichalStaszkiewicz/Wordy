part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileDataInit extends ProfileState {
  ProfileDataInit();
}

class ProfileDataError extends ProfileState {
  ProfileDataError({required this.error});

  CustomError error;
  @override
  List<Object> get props => [];
}

class ProfileDataReady extends ProfileState {
  ProfileDataReady(
      {required this.finishedCourses,
      required this.hotStreak,
      required this.learnedWords,
      required this.achievements,
      required this.beginnerProgress});

  int finishedCourses;
  int hotStreak;
  int learnedWords;
  int achievements;
  List<ActiveCourse> beginnerProgress;

  @override
  List<Object> get props => [
        finishedCourses,
        hotStreak,
        learnedWords,
        achievements,
        beginnerProgress
      ];
}
