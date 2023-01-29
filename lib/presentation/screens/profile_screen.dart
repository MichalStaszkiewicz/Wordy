import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordy/presentation/Widgets/profile_details.dart';
import 'package:wordy/presentation/Widgets/statistics_item.dart';
import 'package:wordy/presentation/screens/achievements_screen.dart';
import 'package:wordy/presentation/screens/finished_topics_screen.dart';

import 'package:wordy/presentation/screens/words_learned_screen.dart';

import '../Bloc/user_settings_and_preferences/user_settings_and_preferences_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ScrollController _scrollStatisticsController =
      ScrollController(keepScrollOffset: false);
  final List<StatisticsItem> _statItems = [
    StatisticsItem(
      image: 'assets/fire.png',
      label: 'Days in a row',
      statisticsCount: 365,
      navigation: null,
    ),
    StatisticsItem(
      image: 'assets/open-book.png',
      label: 'Learned words',
      statisticsCount: 7650,
      navigation:  BlocProvider(
        create: (context) => UserSettingsAndPreferencesBloc()..add(LoadLearnedWords()),
        child: WordsLearnedScreen(),
      ),
    ),
    StatisticsItem(
      image: 'assets/medal.png',
      label: 'Finished topics',
      statisticsCount: 50,
      navigation: const FinishedTopicsScreen(),
    ),
    StatisticsItem(
      image: 'assets/award.png',
      label: 'Achivments',
      statisticsCount: 30,
      navigation: const AchievemetnsScreen(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Profile",
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: Colors.white),
        )),
      ),
      body: BlocBuilder<UserSettingsAndPreferencesBloc,
          UserSettingsAndPreferencesState>(
        builder: (context, state) {
          if (state is UserSettingsAndPreferencesInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserSettingsAndPreferencesLoaded) {
            return ProfileDetails(
                scrollStatisticsController: _scrollStatisticsController,
                statItems: _statItems);
          } else {
            return const Text("Something went wrong");
          }
        },
      ),
    );
  }
}
