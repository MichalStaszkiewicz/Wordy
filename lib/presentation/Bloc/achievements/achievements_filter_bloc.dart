import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/models/achievement.dart';
import '../../../domain/models/achievements_base.dart';

part 'achievements_filter_event.dart';
part 'achievements_filter_state.dart';

class AchievementsFilterBloc
    extends Bloc<AchievementsFilterEvent, AchievementsFilterState> {
  AchievementsFilterBloc() : super(AchievementsFilterInitial()) {
    loadAllAchievements();
    loadUserAchievements();
  }
  void loadAllAchievements() {
    on<LoadAllAchievements>((event, emit) {
      emit(AllAchievements(achievements: event.achievements));
    });
  }

  void loadUserAchievements() {
    on<LoadUserAchievements>((event, emit) {
      emit(UserAchievementsLoaded(achievements: event.achievements));
    });
  }
}
