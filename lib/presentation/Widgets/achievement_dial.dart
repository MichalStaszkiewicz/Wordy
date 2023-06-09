import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';
import 'package:wordy/presentation/Bloc/achievements/achievements_filter_bloc.dart';
import 'package:wordy/presentation/Bloc/user_progress/user_progress_bloc.dart';

class AchievementDial extends StatefulWidget {
  AchievementDial({super.key, required this.userState});
  UserProgressLoaded userState;

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
                context.read<AchievementsFilterBloc>().add(LoadUserAchievements(
                    achievements: widget.userState.userAchievements));
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.lock),
              foregroundColor: Colors.white,
              backgroundColor: Colors.blueAccent,
              label: 'Only no achieved',
              onPressed: () {
                context.read<AchievementsFilterBloc>().add(
                    LoadNoAchievedAchievements(
                        achievements:
                            widget.userState.userAchievementsNonAchieved));
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.folder),
              foregroundColor: Colors.white,
              backgroundColor: Colors.blueAccent,
              label: 'All achievements',
              onPressed: () {
                context.read<AchievementsFilterBloc>().add(LoadAllAchievements(
                    achievements: widget.userState.allAchievements));
              },
            ),
          ],
          child: const Icon(Icons.sort),
        );
      },
    );
  }
}
