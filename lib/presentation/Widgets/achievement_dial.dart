import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

import '../../Utility/locator/service_locator.dart';
import '../../const/consts.dart';
import '../../domain/models/user_achievement.dart';
import '../../global/global_data_manager.dart';
import '../bloc/achievements/achievements_filter_bloc.dart';

class AchievementDial extends StatefulWidget {
  AchievementDial({super.key, required this.achievements});
  List<UserAchievement> achievements;

  @override
  State<AchievementDial> createState() => _AchievementDialState();
}

class _AchievementDialState extends State<AchievementDial> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AchievementsFilterBloc, AchievementsFilterState>(
      builder: (context, aachievementState) {
        return SpeedDial(
          openBackgroundColor: Colors.indigo,
          closedBackgroundColor: Colors.indigo,
          speedDialChildren: [
            SpeedDialChild(
              child: const Icon(Icons.star),
              foregroundColor: Colors.white,
              backgroundColor: Colors.indigoAccent,
              label: ui_lang[locator<GlobalDataManager>().interfaceLanguage]![
                  'achievements_only_achieved'],
              onPressed: () {
                context.read<AchievementsFilterBloc>().add(FilterAchievements(
                      achievements: widget.achievements
                          .where((e) => e.achieved == true)
                          .toList(),
                      filter: ui_lang[locator<GlobalDataManager>()
                          .interfaceLanguage]!['achievements_only_achieved'],
                    ));
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.lock),
              foregroundColor: Colors.white,
              backgroundColor: Colors.indigoAccent,
              label: ui_lang[locator<GlobalDataManager>().interfaceLanguage]![
                  'achievements_locked'],
              onPressed: () {
                context.read<AchievementsFilterBloc>().add(FilterAchievements(
                      achievements: widget.achievements
                          .where((e) => e.achieved == false)
                          .toList(),
                      filter: ui_lang[locator<GlobalDataManager>()
                          .interfaceLanguage]!['achievements_locked'],
                    ));
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.folder),
              foregroundColor: Colors.white,
              backgroundColor: Colors.indigoAccent,
              label: ui_lang[locator<GlobalDataManager>().interfaceLanguage]![
                  'achievements_everything'],
              onPressed: () {
                context.read<AchievementsFilterBloc>().add(FilterAchievements(
                      achievements: widget.achievements,
                      filter: ui_lang[locator<GlobalDataManager>()
                          .interfaceLanguage]!['achievements_everything'],
                    ));
              },
            ),
          ],
          child: const Icon(Icons.sort),
        );
      },
    );
  }
}
