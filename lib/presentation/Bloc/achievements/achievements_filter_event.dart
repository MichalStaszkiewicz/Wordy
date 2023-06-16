part of 'achievements_filter_bloc.dart';

abstract class AchievementsFilterEvent extends Equatable {
  const AchievementsFilterEvent();

  @override
  List<Object> get props => [];
}

class FilterAchievements extends AchievementsFilterEvent {
  FilterAchievements({required this.achievements, required this.filter});
  List<UserAchievement> achievements;
  String filter;
  @override
  List<Object> get props => [filter, achievements];
}
