import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wordy/ProfileScreen/AchievemetnsScreen/achievements_screen.dart';
import 'package:wordy/ProfileScreen/FinishedTopicsScreen/finished_topics_screen.dart';
import 'package:wordy/ProfileScreen/header_in_profile.dart';
import 'package:wordy/ProfileScreen/statistics_item.dart';
import 'package:wordy/ProfileScreen/users_courses.dart';
import 'package:wordy/ProfileScreen/WordsLearnedScreen/words_learned_screen.dart';

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
      statisticsCount: 365, navigation: null,
    ),
    StatisticsItem(
      image: 'assets/open-book.png',
      label: 'Learned words',
      statisticsCount: 7650, navigation: const WordsLearnedScreen(),
    ),
    StatisticsItem(
      image: 'assets/medal.png',
      label: 'Finished topics',
      statisticsCount: 50, navigation: const FinishedTopicsScreen(),
    ),
    StatisticsItem(
      image: 'assets/award.png',
      label: 'Achivments',
      statisticsCount: 30, navigation: const AchievemetnsScreen(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Profile",
          style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),
        )),
      ),
      body: SingleChildScrollView(
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
      ),
    );
  }
}
