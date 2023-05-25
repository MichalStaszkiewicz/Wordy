import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:wordy/presentation/widgets/header_in_profile.dart';
import 'package:wordy/presentation/widgets/statistics_item.dart';
import 'package:wordy/presentation/widgets/users_courses.dart';
import 'package:wordy/presentation/screens/achievements_screen.dart';
import 'package:wordy/presentation/screens/words_learned_screen.dart';
import 'package:wordy/const/consts.dart';

import '../Bloc/user_progress/user_progress_bloc.dart';

class ProfileDetails extends StatefulWidget {
  ProfileDetails();

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  final ScrollController _scrollStatisticsController =
      ScrollController(keepScrollOffset: false);

  List<Widget> statItems(String language) {
    final List<Widget> items = [
      BlocBuilder<UserProgressBloc, UserProgressState>(
        builder: (context, state) {
          state as UserProgressLoaded;
          return StatisticsItem(
            image: 'assets/fire.png',
            label:
                ui_lang[language]!['profile_screen_days_in_a_row'].toString(),
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
            label:
                ui_lang[language]!['profile_screen_learned_words'].toString(),
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
            label:
                ui_lang[language]!['profile_screen_finished_topics'].toString(),
            statisticsCount: state.finishedTopics,
            navigation: null,
          );
        },
      ),
      BlocBuilder<UserProgressBloc, UserProgressState>(
        builder: (context, state) {
          state as UserProgressLoaded;
          return StatisticsItem(
              image: 'assets/award.png',
              label:
                  ui_lang[language]!['profile_screen_achievements'].toString(),
              statisticsCount: state.achievements,
              navigation: AchievementsScreen(
                userState: state,
              ));
        },
      ),
    ];
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderInProfile(
            label:
                ui_lang['English']!['profile_screen_courses_header'].toString(),
          ),
          UserCourses(),
          HeaderInProfile(
            label: ui_lang['English']!['profile_screen_statistics_header']
                .toString(),
          ),
          Container(
            height: 400,
            child: GridView.builder(
              controller: _scrollStatisticsController,
              itemCount: statItems('English').length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) => statItems('English')[index],
            ),
          )
        ],
      ),
    );
  }
}
