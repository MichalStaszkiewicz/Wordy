import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/data/network/exceptions/exception_helper.dart';
import 'package:wordy/data/network/exceptions/unexpected_error.dart';
import 'package:wordy/domain/models/achievement.dart';
import 'package:wordy/presentation/bloc/achievements/achievements_filter_bloc.dart';

import 'package:wordy/presentation/widgets/achievement_item_back.dart';
import 'package:wordy/presentation/widgets/exit_button.dart';
import 'package:wordy/presentation/widgets/flip_cards.dart';

import 'package:wordy/const/consts.dart';
import 'package:wordy/utility/dialog_manager.dart';

import '../../domain/models/user_achievement.dart';
import '../widgets/achievement_dial.dart';
import '../widgets/achievement_item_front.dart';
import '../widgets/loading_data.dart';
import '../widgets/title_with_back_button.dart';

class AchievementsScreen extends StatefulWidget {
  AchievementsScreen({required this.achievements});
  List<UserAchievement> achievements;

  @override
  State<AchievementsScreen> createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.achievements.length.toString());
    return BlocProvider(
      create: (context) => AchievementsFilterBloc()
        ..add(FilterAchievements(
            achievements: widget.achievements,
            filter: 'Achievements - Everything')),
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
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.decelerate,
                                  child: FlipCards(
                                    back: AchievementItemBack(
                                      description: state.achievements[index]
                                          .achievement.description!,
                                      achieved:
                                          state.achievements[index].achieved,
                                    ),
                                    front: AchievementItemFront(
                                      image: "assets/medal.png",
                                      name: state.achievements[index]
                                          .achievement.name!,
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
              return LoadingData();
            }
          }),
        ),
      ),
    );
  }
}
