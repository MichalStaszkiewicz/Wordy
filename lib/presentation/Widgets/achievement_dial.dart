import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';
import 'package:wordy/presentation/Bloc/achievements/achievements_filter_bloc.dart';


class AchievementDial extends StatefulWidget {
  AchievementDial({
    super.key,
  });

  @override
  State<AchievementDial> createState() => _AchievementDialState();
}

class _AchievementDialState extends State<AchievementDial> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AchievementsFilterBloc, AchievementsFilterState>(
      builder: (context, aachievementState) {
        return SpeedDial(
          speedDialChildren: [
            SpeedDialChild(
              child: const Icon(Icons.star),
              foregroundColor: Colors.white,
              backgroundColor: Colors.blueAccent,
              label: 'Only achieved already',
              onPressed: () {
                context
                    .read<AchievementsFilterBloc>()
                    .add(LoadUserAchievements(achievements: []));
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.lock),
              foregroundColor: Colors.white,
              backgroundColor: Colors.blueAccent,
              label: 'Only no achieved',
              onPressed: () {
                context
                    .read<AchievementsFilterBloc>()
                    .add(LoadNoAchievedAchievements(achievements: []));
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.folder),
              foregroundColor: Colors.white,
              backgroundColor: Colors.blueAccent,
              label: 'All achievements',
              onPressed: () {
                context
                    .read<AchievementsFilterBloc>()
                    .add(LoadAllAchievements(achievements: []));
              },
            ),
          ],
          child: const Icon(Icons.sort),
        );
      },
    );
  }
}
