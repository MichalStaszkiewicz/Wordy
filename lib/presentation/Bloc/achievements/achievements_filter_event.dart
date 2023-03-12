part of 'achievements_filter_bloc.dart';

abstract class AchievementsFilterEvent extends Equatable {
  const AchievementsFilterEvent();

  @override
  List<Object> get props => [];
}

class LoadUserAchievements extends AchievementsFilterEvent {
  LoadUserAchievements({required this.achievements});
  List<Achievement> achievements;
}

class LoadAllAchievements extends AchievementsFilterEvent {
  LoadAllAchievements({required this.achievements});
  List<AchievementBase> achievements;
}
