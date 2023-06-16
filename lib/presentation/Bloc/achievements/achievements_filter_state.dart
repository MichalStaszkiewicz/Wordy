part of 'achievements_filter_bloc.dart';

abstract class AchievementsFilterState extends Equatable {
  const AchievementsFilterState();

  @override
  List<Object> get props => [];
}

class AchievementsFilterInitial extends AchievementsFilterState {
  const AchievementsFilterInitial();
}

class AchievementsLoaded extends AchievementsFilterState {
  AchievementsLoaded({required this.achievements, required this.filter});
  List<UserAchievement> achievements;
  String filter;

  @override
  List<Object> get props => [achievements, filter];
}

class AchievementsLoading extends AchievementsFilterState {
  AchievementsLoading();
}

class AchievementError extends AchievementsFilterState {
  AchievementError({required this.error});
  CustomError error;
  @override
  List<Object> get props => [error];
}
