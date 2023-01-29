import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordy/presentation/Widgets/header_in_profile.dart';
import 'package:wordy/presentation/Widgets/statistics_item.dart';
import 'package:wordy/presentation/Widgets/users_courses.dart';
import 'package:wordy/presentation/screens/achievements_screen.dart';
import 'package:wordy/presentation/screens/words_learned_screen.dart';

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
          label: 'Days in a row',
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
          label: 'Learned words',
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
          label: 'Finished topics',
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
          label: 'Achivments',
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
            label: "My Courses",
          ),
          const UsersCourses(),
          HeaderInProfile(
            label: "Statistics",
          ),
          Container(
            height: 400,
            child: GridView.builder(
              controller: _scrollStatisticsController,
              itemCount: 4,
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
