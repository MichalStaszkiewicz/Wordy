import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:wordy/domain/models/achievements_base.dart';
import 'package:wordy/presentation/Bloc/user_progress/user_progress_bloc.dart';
import 'package:wordy/presentation/Provider/interface_language_provider.dart';
import 'package:wordy/presentation/Widgets/achievement_item_back.dart';
import 'package:wordy/presentation/Widgets/flip_cards.dart';
import 'package:wordy/presentation/Widgets/statistics_item.dart';
import 'package:wordy/shared/consts.dart';

import '../../domain/models/achievement.dart';
import '../Bloc/achievements/achievements_filter_bloc.dart';
import '../Widgets/achievement_item_front.dart';
import '../Widgets/loading_data.dart';

class AchievementsScreen extends StatefulWidget {
  AchievementsScreen(
      {required this.allAchievements, required this.userAchievements});
  List<AchievementBase> allAchievements;
  List<Achievement> userAchievements;

  @override
  State<AchievementsScreen> createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AchievementsFilterBloc()
        ..add(LoadUserAchievements(achievements: widget.userAchievements)),
      child: BlocBuilder<AchievementsFilterBloc, AchievementsFilterState>(
        builder: (context, state) {
         
          if (state is UserAchievementsLoaded) {
            return Consumer<InterfaceDataProvider>(
              builder: (context, value, child) => Scaffold(
                appBar: AppBar(
                  title: Container(
                    padding: const EdgeInsets.only(right: 40),
                    child: Center(
                      child: Container(
                        child: Text(
                          ui_lang[value.interfaceLangauge]![
                              'profile_screen_achievements'],
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                body: GridView.builder(
                    itemCount: state.achievements.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) => FlipCards(
                          back: AchievementItemBack(
                            description: state.achievements[index].description,
                          ),
                          front: AchievementItemFront(
                            image: state.achievements[index].image,
                            name: state.achievements[index].name,
                            currentProgress:
                                state.achievements[index].currentProgress,
                            maximum:
                                state.achievements[index].progressToAchieve,
                          ),
                        )),
              ),
            );
          }
          if (state is AllAchievements) {
            return Consumer<InterfaceDataProvider>(
              builder: (context, value, child) => Scaffold(
                appBar: AppBar(
                  title: Container(
                    padding: const EdgeInsets.only(right: 40),
                    child: Center(
                      child: Container(
                        child: Text(
                          ui_lang[value.interfaceLangauge]![
                              'profile_screen_achievements'],
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                body: GridView.builder(
                    itemCount: state.achievements.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) => FlipCards(
                          back: AchievementItemBack(
                            description: state.achievements[index].description,
                          ),
                          front: AchievementItemFront(
                            image: state.achievements[index].image,
                            name: state.achievements[index].name,
                            currentProgress: null,
                            maximum: null,
                          ),
                        )),
              ),
            );
          } else {
            return LoadingData();
          }
        },
      ),
    );
  }
}
