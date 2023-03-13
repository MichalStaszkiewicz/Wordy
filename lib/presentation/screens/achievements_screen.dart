import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:wordy/domain/models/achievements_base.dart';
import 'package:wordy/presentation/Bloc/user_progress/user_progress_bloc.dart';
import 'package:wordy/presentation/Provider/interface_language_provider.dart';
import 'package:wordy/presentation/Widgets/achievement_item_back.dart';
import 'package:wordy/presentation/Widgets/flip_cards.dart';
import 'package:wordy/presentation/Widgets/statistics_item.dart';
import 'package:wordy/presentation/Widgets/unexpected_error.dart';
import 'package:wordy/shared/consts.dart';

import '../../domain/models/achievement.dart';
import '../Bloc/achievements/achievements_filter_bloc.dart';
import '../Widgets/achievement_dial.dart';
import '../Widgets/achievement_item_front.dart';
import '../Widgets/loading_data.dart';

class AchievementsScreen extends StatefulWidget {
  AchievementsScreen({required this.userState});
  UserProgressLoaded userState;

  @override
  State<AchievementsScreen> createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AchievementsFilterBloc()
        ..add(LoadUserAchievements(
            achievements: widget.userState.userAchievements)),
      child: BlocBuilder<AchievementsFilterBloc, AchievementsFilterState>(
        builder: (context, achievementsState) {
          if (achievementsState is AchievedAlready) {
            if (achievementsState.achievements.isEmpty) {
              return Consumer<InterfaceDataProvider>(
                builder: (context, value, child) => Scaffold(
                    floatingActionButton: AchievementDial(
                      userState: widget.userState,
                    ),
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
                    body: Center(
                      child: Container(
                        child: Text(
                          ui_lang[value.interfaceLangauge]!['no_achievements'],
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Color(0xFFA2A2A2)),
                        ),
                      ),
                    )),
              );
            } else {
              return Consumer<InterfaceDataProvider>(
                builder: (context, value, child) => Scaffold(
                  floatingActionButton: AchievementDial(
                    userState: widget.userState,
                  ),
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
                      itemCount: achievementsState.achievements.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) => FlipCards(
                            back: AchievementItemBack(
                              description: achievementsState
                                  .achievements[index].description,
                              achieved: achievementsState
                                  .achievements[index].achieved,
                            ),
                            front: AchievementItemFront(
                              image:
                                  achievementsState.achievements[index].image,
                              name: achievementsState.achievements[index].name,
                              currentProgress: null,
                              maximum: null,
                            ),
                          )),
                ),
              );
            }
          }
          if (achievementsState is NotAchievedOnly) {
            return Consumer<InterfaceDataProvider>(
              builder: (context, value, child) => Scaffold(
                floatingActionButton: AchievementDial(
                  userState: widget.userState,
                ),
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
                    itemCount: achievementsState.achievements.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) => FlipCards(
                          back: AchievementItemBack(
                            achieved:
                                achievementsState.achievements[index].achieved,
                            description: achievementsState
                                .achievements[index].description,
                          ),
                          front: AchievementItemFront(
                            image: achievementsState.achievements[index].image,
                            name: achievementsState.achievements[index].name,
                            currentProgress: achievementsState
                                .achievements[index].currentProgress,
                            maximum: achievementsState
                                .achievements[index].progressToAchieve,
                          ),
                        )),
              ),
            );
          }
          if (achievementsState is AllAchievements) {
            return Consumer<InterfaceDataProvider>(
              builder: (context, value, child) => Scaffold(
                floatingActionButton: AchievementDial(
                  userState: widget.userState,
                ),
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
                    itemCount: achievementsState.achievements.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) => FlipCards(
                          back: AchievementItemBack(
                            achieved:
                                achievementsState.achievements[index].achieved,
                            description: achievementsState
                                .achievements[index].description,
                          ),
                          front: AchievementItemFront(
                            image: achievementsState.achievements[index].image,
                            name: achievementsState.achievements[index].name,
                            currentProgress: achievementsState
                                .achievements[index].currentProgress,
                            maximum: achievementsState
                                .achievements[index].progressToAchieve,
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
