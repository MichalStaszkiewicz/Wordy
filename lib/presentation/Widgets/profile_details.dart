import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/presentation/bloc/profile/profile_bloc.dart';

import 'package:wordy/presentation/widgets/statistics_item.dart';

import 'package:wordy/presentation/screens/achievements_screen.dart';
import 'package:wordy/presentation/screens/words_learned_screen.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/utility/dialog_manager.dart';

import '../../const/app_router.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  final ScrollController _scrollStatisticsController =
      ScrollController(keepScrollOffset: false);

  List<Widget> statItems(String language) {
    final List<Widget> items = [
      BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          state as ProfileDataReady;
          return StatisticsItem(
            image: 'assets/fire.png',
            label:
                ui_lang[language]!['profile_screen_days_in_a_row'].toString(),
            statisticsCount: state.hotStreak,
          );
        },
      ),
      BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          state as ProfileDataReady;

          return GestureDetector(
            onTap: () {
              context.pushNamed(AppRouter.wordsLearnedScreen,
                  extra: {'beginnerProgress': state.beginnerProgress});
            },
            child: StatisticsItem(
              image: 'assets/open-book.png',
              label:
                  ui_lang[language]!['profile_screen_learned_words'].toString(),
              statisticsCount: state.learnedWords,
            ),
          );
        },
      ),
      BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          state as ProfileDataReady;
          return StatisticsItem(
            image: 'assets/medal.png',
            label:
                ui_lang[language]!['profile_screen_finished_topics'].toString(),
            statisticsCount: state.finishedCourses,
          );
        },
      ),
      BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          state as ProfileDataReady;
          return GestureDetector(
            onTap: () {
              context.pushNamed(AppRouter.achievementsScreen, extra: {
                'achievements': state.achievements,
              });
            },
            child: StatisticsItem(
              image: 'assets/award.png',
              label:
                  ui_lang[language]!['profile_screen_achievements'].toString(),
              statisticsCount: state.achievements
                  .where((e) => e.achieved == true)
                  .toList()
                  .length,
            ),
          );
        },
      ),
    ];
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Text(
              "Profile",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: 20,
                    letterSpacing: 0.5,
                    color: Color.fromRGBO(30, 30, 30, 1.0),
                  ),
            ),
            Container(
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    child: _buildProfileImage(),
                  ),
                  Expanded(
                      flex: 3,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 3),
                              child: Text(
                                "Monkey .D luffy",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    child: Icon(
                                      Icons.location_on,
                                      size: 20,
                                      color: Color.fromARGB(255, 151, 151, 151),
                                    ),
                                  ),
                                  Text(
                                    'Poland',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                          color: Color.fromARGB(
                                              255, 151, 151, 151),
                                        ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
            Text(
              textAlign: TextAlign.left,
              ui_lang['english']!['profile_screen_statistics_header']
                  .toString(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Container(
              height: 400,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                controller: _scrollStatisticsController,
                itemCount: statItems('english').length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) => statItems('english')[index],
              ),
            )
          ],
        ),
      ),
    );
  }

  GestureDetector _buildProfileImage() {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => DialogManager.editProfileDialog(context));
      },
      child: Stack(
        children: [
          Center(
              child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/cb6d15ee-9f60-434a-9a5d-d91026e33e0a/d7til5w-2f3260a3-7092-47b4-aad3-d921b361cc4b.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2NiNmQxNWVlLTlmNjAtNDM0YS05YTVkLWQ5MTAyNmUzM2UwYVwvZDd0aWw1dy0yZjMyNjBhMy03MDkyLTQ3YjQtYWFkMy1kOTIxYjM2MWNjNGIuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.pD52YTUbCEL4DLf6lnWcLUJFI9gpFglFsfO5xLAMErQ')),
                borderRadius: BorderRadius.circular(50)),
          )),
          Positioned(
            left: 63,
            top: 63,
            child: Container(
              height: 23,
              width: 23,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(50)),
              child: Center(
                child: Container(
                    height: 17,
                    width: 17,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromARGB(255, 57, 211, 116),
                    ),
                    child: Center(
                        child: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 12,
                    ))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
