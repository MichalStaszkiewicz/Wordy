import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/models/custom_error.dart';
import '../../../domain/models/user_achievement.dart';

part 'achievements_filter_event.dart';
part 'achievements_filter_state.dart';

class AchievementsFilterBloc
    extends Bloc<AchievementsFilterEvent, AchievementsFilterState> {
  AchievementsFilterBloc() : super(const AchievementsFilterInitial()) {
    loadAchievements();
  }

  void loadAchievements() {
    on<FilterAchievements>((event, emit) {
      emit(AchievementsLoaded(
          achievements: event.achievements, filter: event.filter));
    });
  }
}
