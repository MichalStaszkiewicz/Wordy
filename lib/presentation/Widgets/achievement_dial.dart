import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

import '../../domain/models/achievement.dart';
import '../../domain/models/user_achievement.dart';
import '../bloc/achievements/achievements_filter_bloc.dart';

class AchievementDial extends StatefulWidget {
  AchievementDial({required this.achievements});
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
              label: 'Only achieved already',
              onPressed: () {
                context.read<AchievementsFilterBloc>().add(FilterAchievements(
                      achievements: widget.achievements
                          .where((e) => e.achieved == true)
                          .toList(),
                      filter: 'Achievements - Achieved',
                    ));
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.lock),
              foregroundColor: Colors.white,
              backgroundColor: Colors.indigoAccent,
              label: 'Only no achieved',
              onPressed: () {
                context.read<AchievementsFilterBloc>().add(FilterAchievements(
                      achievements: widget.achievements
                          .where((e) => e.achieved == false)
                          .toList(),
                      filter: 'Achievements - Achievable',
                    ));
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.folder),
              foregroundColor: Colors.white,
              backgroundColor: Colors.indigoAccent,
              label: 'All achievements',
              onPressed: () {
                context.read<AchievementsFilterBloc>().add(FilterAchievements(
                    achievements: widget.achievements,
                    filter: 'Achievements - Everything'));
              },
            ),
          ],
          child: const Icon(Icons.sort),
        );
      },
    );
  }
}
