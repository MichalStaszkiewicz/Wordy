import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:wordy/data/network/exceptions/exception_helper.dart';
import 'package:wordy/data/network/exceptions/unexpected_error.dart';
import 'package:wordy/presentation/bloc/achievements/achievements_filter_bloc.dart';
import 'package:wordy/presentation/widgets/card/achievement_card/achievement_item_back.dart';
import 'package:wordy/presentation/widgets/card/achievement_card/achievement_item_front.dart';


import 'package:wordy/presentation/widgets/card/flip_cards.dart';

import 'package:wordy/const/consts.dart';
import 'package:wordy/utility/dialog_manager.dart';

import '../../Utility/locator/service_locator.dart';
import '../../domain/models/user_achievement.dart';
import '../../global/global_data_manager.dart';
import '../widgets/achievement_dial.dart';
import '../widgets/loading_data.dart';
import '../widgets/button/title_with_back_button.dart';

class AchievementsScreen extends StatefulWidget {
  AchievementsScreen({super.key, required this.achievements});
  List<UserAchievement> achievements;

  @override
  State<AchievementsScreen> createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AchievementsFilterBloc()
        ..add(FilterAchievements(
          achievements: widget.achievements,
          filter: translate[locator<GlobalDataManager>().interfaceLanguage]![
              'achievements_everything'],
        )),
      child: Scaffold(
        floatingActionButton: AchievementDial(
          achievements: widget.achievements,
        ),
        body: SafeArea(
          child: BlocBuilder<AchievementsFilterBloc, AchievementsFilterState>(
              builder: (context, state) {
            if (state is AchievementsLoaded) {
              return Column(
                children: [
                  Expanded(
                      flex: 1,
                      child: TitleWithBackButton(
                        title: state.filter,
                      )),
                  Expanded(
                    flex: 8,
                    child: Container(
                      child: GridView.builder(
                          itemCount: state.achievements.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) =>
                              AnimationConfiguration.staggeredGrid(
                                position: index,
                                columnCount: 2,
                                child: ScaleAnimation(
                                  scale: 0,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.decelerate,
                                  child: FlipCards(
                                    back: AchievementItemBack(
                                      description: translate[
                                                  locator<GlobalDataManager>()
                                                      .interfaceLanguage]![
                                              'achievements'][
                                          state.achievements[index].achievement
                                              .name!
                                              .toLowerCase()
                                              .replaceAll(
                                                  ' ', '_')]['description'],
                                      achieved:
                                          state.achievements[index].achieved,
                                    ),
                                    front: AchievementItemFront(
                                      image: "assets/medal.png",
                                      name: translate[locator<GlobalDataManager>()
                                                  .interfaceLanguage]![
                                              'achievements'][
                                          state.achievements[index].achievement
                                              .name!
                                              .toLowerCase()
                                              .replaceAll(' ', '_')]['name'],
                                      currentProgress:
                                          state.achievements[index].progress,
                                      maximum: state
                                          .achievements[index].achievement.goal,
                                    ),
                                  ),
                                ),
                              )),
                    ),
                  ),
                ],
              );
            } else if (state is AchievementError) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                DialogManager.showErrorDialog(
                    ExceptionHelper.getErrorMessage(UnexpectedError()),
                    context,
                    () {});
              });
              return Container();
            } else {
              return const LoadingData();
            }
          }),
        ),
      ),
    );
  }
}
