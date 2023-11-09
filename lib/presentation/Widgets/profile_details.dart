import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:wordy/global/global_data_manager.dart';
import 'package:wordy/presentation/bloc/profile/profile_bloc.dart';

import 'package:wordy/presentation/widgets/statistics_item.dart';

import 'package:wordy/const/consts.dart';

import '../../Utility/locator/service_locator.dart';
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
                translate[language]!['profile_screen_days_in_a_row'].toString(),
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
                  translate[language]!['progress'].toString(),
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
                translate[language]!['profile_screen_finished_topics'].toString(),
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
                  translate[language]!['profile_screen_achievements'].toString(),
              statisticsCount:
                  state.achievements.where((e) => e.achieved == true).length,
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
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            state as ProfileDataReady;
            return Column(
              children: [
                Text(
                  translate[locator<GlobalDataManager>().interfaceLanguage]![
                      'profile_screen_app_bar'],
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize: 20,
                        letterSpacing: 0.5,
                        color: const Color.fromRGBO(30, 30, 30, 1.0),
                      ),
                ),
                SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Center(
                                child: Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50)),
                              child:const Image(image: AssetImage('assets/penguin.png'),),
                            )),/*
                            Positioned(
                              left: 63,
                              top: 63,
                              child: Container(
                                height: 23,
                                width: 23,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Center(
                                  child: Container(
                                      height: 17,
                                      width: 17,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color:
                                            Color.fromARGB(255, 63, 238, 130),
                                      ),
                                      child: const Center(
                                          child: Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                        size: 12,
                                      ))),
                                ),
                              ),
                            ),
                            */
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 3,
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 3),
                                  child: Text(
                                    state.fullName,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
                Text(
                  textAlign: TextAlign.left,
                  translate[locator<GlobalDataManager>().interfaceLanguage]![
                          'profile_screen_statistics_header']
                      .toString(),
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(
                  height: 400,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _scrollStatisticsController,
                    itemCount: statItems(
                            locator<GlobalDataManager>().interfaceLanguage)
                        .length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) => statItems(
                        locator<GlobalDataManager>().interfaceLanguage)[index],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
