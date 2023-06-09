import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/models/achievement.dart';

part 'achievements_filter_event.dart';
part 'achievements_filter_state.dart';

class AchievementsFilterBloc
    extends Bloc<AchievementsFilterEvent, AchievementsFilterState> {
  AchievementsFilterBloc() : super(const AchievementsFilterInitial()) {
    loadAllAchievements();
    loadUserAchievements();
    loadNoAchievedAchievements();
  }
  void loadAllAchievements() {
    on<LoadAllAchievements>((event, emit) {
      emit(AllAchievements(achievements: event.achievements));
    });
  }

  void loadNoAchievedAchievements() {
    on<LoadNoAchievedAchievements>((event, emit) {
     emit(NotAchievedOnly(achievements: event.achievements));
    });
  }

  void loadUserAchievements() {
    on<LoadUserAchievements>((event, emit) {
      emit(AchievedAlready(achievements: event.achievements));
    });
  }
}
