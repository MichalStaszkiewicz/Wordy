import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:wordy/Utility/utility.dart';
import 'package:wordy/presentation/Bloc/topics/topics_bloc.dart';
import 'package:wordy/presentation/Bloc/user_progress/user_progress_bloc.dart';
import 'package:wordy/presentation/Widgets/topic_grid_view.dart';

import 'package:wordy/presentation/screens/topic_screen_today_statistics.dart';
import 'package:wordy/shared/consts.dart';

import '../Provider/interface_language_provider.dart';
import '../Widgets/language_to_choose.dart';
import '../Widgets/unexpected_error.dart';

class TopicScreen extends StatefulWidget {
  TopicScreen();
  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen>
    with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late final AnimationController _animationController =
      AnimationController(vsync: this, duration: const Duration(seconds: 1));
  late final Animation<double> animation = Tween<double>(
          begin: -MediaQuery.of(context).size.height / 2, end: 0)
      .animate(
          CurvedAnimation(parent: _animationController, curve: Curves.linear)
            ..addListener(() {
              setState(() {});
            }));
  late final Animation<double> barrierAnimation =
      Tween<double>(begin: 0, end: 0.5).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.linear)
            ..addListener(() {
              setState(() {});
            }));

  Utility utility = Utility();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
String interfaceLanguage = Provider.of<InterfaceLanguageProvider>(context, listen: false).interfaceLangauge;
    return BlocBuilder<UserProgressBloc, UserProgressState>(
      builder: (context, userProgressState) {
        if (userProgressState is UserCoursesAndSettingsInformations) {
          return BlocProvider(
            create: (context) => TopicsBloc()..add(LoadTopics()),
            child: BlocBuilder<TopicsBloc, TopicsState>(
              builder: (context, topicsState) {
                if (topicsState is TopicsInitial) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (topicsState is TopicsLoaded) {
                  return GestureDetector(
                    onTap: () {
                      if (_animationController.status !=
                          AnimationStatus.forward) {
                        _animationController.reverse();
                      }

                      context.read<TopicsBloc>().add(ChooseSettingsForQuiz(
                          globalPosition: topicsState.globalPosition,
                          index: topicsState.index,
                          localPosition: topicsState.localPosition,
                          settingsOpen: false));
                    },
                    child: Stack(children: [
                      CustomScrollView(
                        controller: _scrollController,
                        slivers: [
                          SliverAppBar(
                            automaticallyImplyLeading: false,
                            title: Center(
                                child: Text(
                              ui_lang[interfaceLanguage]![
                                      'home_screen_app_bar']
                                  .toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: Colors.white),
                            )),
                          ),
                          SliverAppBar(
                            expandedHeight: 80,
                            flexibleSpace: Center(
                              child: Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                color: Colors.blue,
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                      'assets/${flagWays[userProgressState.currentCourse]}-circular.png'),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                if (_animationController
                                                            .status !=
                                                        AnimationStatus
                                                            .reverse &&
                                                    _animationController
                                                            .status !=
                                                        AnimationStatus
                                                            .completed) {
                                                  _animationController
                                                      .forward();
                                                  context
                                                      .read<UserProgressBloc>()
                                                      .add(
                                                          LoadUserSettingsAndCourseInformations());
                                                }
                                              },
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    left: 10),
                                                child: const Image(
                                                    width: 15,
                                                    image: AssetImage(
                                                        "assets/down-arrow.png")),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: TopicScreenTodayStaticstics(
                                          image: "assets/fire.png",
                                          label: 0,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: TopicScreenTodayStaticstics(
                                          image: "assets/open-book.png",
                                          label: 0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            backgroundColor: Colors.white,
                            pinned: true,
                            floating: true,
                            automaticallyImplyLeading: false,
                          ),
                          TopicGridView()
                        ],
                      ),
                      utility.quizSettings(
                          topicsState.selectedTopic,
                          topicsState.localPosition,
                          topicsState.globalPosition,
                          topicsState.index,
                          topicsState.topics.elementAt(topicsState.index).name,
                          context,
                          _scrollController),
                      if (_animationController.status ==
                              AnimationStatus.forward ||
                          _animationController.status ==
                              AnimationStatus.reverse ||
                          _animationController.status ==
                              AnimationStatus.completed)
                        Container(
                          color:
                              Colors.black.withOpacity(barrierAnimation.value),
                        ),
                      utility.languageChangeMenu(animation.value),
                    ]),
                  );
                } else {
                  return UnexpectedError();
                }
              },
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
