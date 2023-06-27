part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileDataInit extends ProfileState {
  const ProfileDataInit();
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
      required this.beginnerProgress,
      required this.fullName});

  int finishedCourses;
  int hotStreak;
  int learnedWords;
  List<UserAchievement> achievements;
  String fullName;
  List<ActiveCourse> beginnerProgress;

  @override
  List<Object> get props => [
        finishedCourses,
        hotStreak,
        learnedWords,
        beginnerProgress,
        achievements,
        fullName
      ];
}
