part of 'achievements_filter_bloc.dart';

abstract class AchievementsFilterState extends Equatable {
  const AchievementsFilterState();

  @override
  List<Object> get props => [];
}

class AchievementsFilterInitial extends AchievementsFilterState {
  AchievementsFilterInitial();
}

class UserAchievementsLoaded extends AchievementsFilterState {
  UserAchievementsLoaded({required this.achievements});
  List<Achievement> achievements;
  @override
  List<Object> get props => [achievements];
}

class AllAchievements extends AchievementsFilterState {
  AllAchievements({required this.achievements});
  List<AchievementBase> achievements;
  @override
  List<Object> get props => [achievements];
}
