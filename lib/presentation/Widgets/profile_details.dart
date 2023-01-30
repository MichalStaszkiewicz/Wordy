import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordy/presentation/Widgets/header_in_profile.dart';
import 'package:wordy/presentation/Widgets/statistics_item.dart';
import 'package:wordy/presentation/Widgets/users_courses.dart';
import 'package:wordy/presentation/screens/achievements_screen.dart';
import 'package:wordy/presentation/screens/words_learned_screen.dart';
import 'package:wordy/shared/consts.dart';

import '../Bloc/user_progress/user_progress_bloc.dart';
import '../screens/finished_topics_screen.dart';

class ProfileDetails extends StatefulWidget {
  ProfileDetails();

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  final ScrollController _scrollStatisticsController =
      ScrollController(keepScrollOffset: false);
  final List<Widget> _statItems = [
    BlocBuilder<UserProgressBloc, UserProgressState>(
      builder: (context, state) {
        state as UserProgressLoaded;
        return StatisticsItem(
          image: 'assets/fire.png',
          label: ui_lang[userLanguage]!['profile_screen_days_in_a_row'].toString(),
          statisticsCount: state.daysStreak,
          navigation: null,
        );
      },
    ),
    BlocBuilder<UserProgressBloc, UserProgressState>(
      builder: (context, state) {
        state as UserProgressLoaded;
        return StatisticsItem(
          image: 'assets/open-book.png',
          label: ui_lang[userLanguage]!['profile_screen_learned_words'].toString(),
          statisticsCount: state.learnedWords,
          navigation: BlocProvider(
            create: (context) => UserProgressBloc()..add(LoadLearnedWords()),
            child: WordsLearnedScreen(),
          ),
        );
      },
    ),
    BlocBuilder<UserProgressBloc, UserProgressState>(
      builder: (context, state) {
        state as UserProgressLoaded;
        return StatisticsItem(
          image: 'assets/medal.png',
          label:  ui_lang[userLanguage]!['profile_screen_finished_topics'].toString(),
          statisticsCount: state.finishedTopics,
          navigation: const FinishedTopicsScreen(),
        );
      },
    ),
    BlocBuilder<UserProgressBloc, UserProgressState>(
      builder: (context, state) {
            state as UserProgressLoaded;
        return StatisticsItem(
          image: 'assets/award.png',
          label:ui_lang[userLanguage]!['profile_screen_achievements'].toString(),
          statisticsCount: state.achievements,
          navigation: const AchievemetnsScreen(),
        );
      },
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderInProfile(
            label:ui_lang[userLanguage]!['profile_screen_courses_header'].toString(),
          ),
          const UsersCourses(),
          HeaderInProfile(
            label: ui_lang[userLanguage]!['profile_screen_statistics_header'].toString(),
          ),
          Container(
            height: 400,
            child: GridView.builder(
              controller: _scrollStatisticsController,
              itemCount: _statItems.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) => _statItems[index],
            ),
          )
        ],
      ),
    );
  }
}
