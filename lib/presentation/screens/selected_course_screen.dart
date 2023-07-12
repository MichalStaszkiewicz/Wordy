import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/const/app_router.dart';
import 'package:wordy/const/enums.dart';
import 'package:wordy/global/course_progress_tracker.dart';

import 'package:wordy/presentation/widgets/circular_precentage_chart.dart';
import 'package:wordy/presentation/widgets/loading_data.dart';
import 'package:wordy/presentation/widgets/selected_course_topic_card.dart';
import 'package:wordy/utility/dialog_manager.dart';

import '../../Utility/locator/service_locator.dart';
import '../../const/consts.dart';
import '../../domain/models/active_course.dart';

import '../../domain/models/progress_in_topic.dart';
import '../../domain/repositiories/stream_repository.dart';

import '../../global/global_data_manager.dart';
import '../bloc/courses_update/courses_update_bloc.dart';
import '../widgets/selected_course_background.dart';

class SelectedCourseScreen extends StatefulWidget {
  const SelectedCourseScreen({super.key});

  @override
  State<SelectedCourseScreen> createState() => _SelectedCourseScreenState();
}

class _SelectedCourseScreenState extends State<SelectedCourseScreen>
    with TickerProviderStateMixin {
  bool isListExpanded = false;
  late AnimationController _courseProgressController;
  late Animation? _courseProgressAnimation;
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
              ScrollDirection.forward ||
          _scrollController.position.userScrollDirection ==
              ScrollDirection.reverse) {
        setState(() {
          isListExpanded = false;
        });
      }
    });
    ActiveCourse? beforeQuiz = locator<CourseProgressTracker>().beforeQuiz;
    ActiveCourse? afterQuiz = locator<CourseProgressTracker>().afterQuiz;
    _courseProgressController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    if (beforeQuiz == null || afterQuiz == null) {
      _courseProgressAnimation = null;
    } else {
      _courseProgressAnimation = Tween<double>(
              begin: beforeQuiz.totalProgress ?? 0,
              end: afterQuiz.totalProgress ?? 0)
          .animate(_courseProgressController)
        ..addListener(() {
          setState(() {});
        });
    }
    if (_courseProgressAnimation != null) {
      _courseProgressController.forward();
    }

    super.initState();
  }

  @override
  void dispose() {
    _courseProgressController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  List<SelectedCourseTopicCard> _buildTopics(List<ProgressInTopic> progress,
      BuildContext context, ActiveCourse? course) {
    List<SelectedCourseTopicCard> result = [];
    for (ProgressInTopic topic in progress) {
      result.add(SelectedCourseTopicCard(
        progress: topic,
        beforeQuiz: course,
        topic: topic.topic,
      ));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CoursesUpdateBloc(locator<StreamRepository>())
          ..add(const CurrentCourseInitial()),
        child: BlocBuilder<CoursesUpdateBloc, CoursesUpdateState>(
          builder: (context, state) {
            if (state is CourseTopicsLoaded) {
              ActiveCourse? beforeQuizCopy;
              if (locator<CourseProgressTracker>().beforeQuiz == null) {
                locator<CourseProgressTracker>().beforeQuiz = state.course;
                beforeQuizCopy = locator<CourseProgressTracker>().beforeQuiz;
              } else {
                beforeQuizCopy = locator<CourseProgressTracker>().beforeQuiz;
                locator<CourseProgressTracker>().beforeQuiz = state.course;
              }

              return CustomPaint(
                painter:
                    SelectedCourseBackground(backgroundColor: Colors.amber),
                child: SafeArea(
                  child: Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Expanded(
                              child: Container(
                                child: CustomScrollView(
                                    physics: isListExpanded
                                        ? const NeverScrollableScrollPhysics()
                                        : null,
                                    controller: _scrollController,
                                    slivers: [
                                      SliverAppBar(
                                        flexibleSpace: Container(
                                          color: Colors.amber,
                                        ),
                                        pinned: true,
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                locator<CourseProgressTracker>()
                                                    .beforeQuiz = null;
                                                locator<CourseProgressTracker>()
                                                    .afterQuiz = null;
                                                locator<CourseProgressTracker>()
                                                        .quizType =
                                                    QuizType.learning;
                                                context.go(AppRouter.home);
                                              },
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    left: 10),
                                                child: const Icon(
                                                  Icons
                                                      .arrow_back_ios_new_rounded,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              ui_lang[locator<
                                                          GlobalDataManager>()
                                                      .interfaceLanguage]![
                                                  'course'],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge!
                                                  .copyWith(
                                                      color: Colors.white),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  right: 10),
                                              height: 50,
                                              width: 50,
                                            )
                                          ],
                                        ),
                                      ),
                                      SliverToBoxAdapter(
                                        child: _buildCurrentCourseInformations(
                                            context,
                                            state.course,
                                            _courseProgressAnimation != null
                                                ? _courseProgressAnimation!
                                                    .value
                                                : state.course.totalProgress),
                                      ),
                                      SliverToBoxAdapter(
                                        child: SizedBox(
                                          height: (150 *
                                                      state.course.topicProgress
                                                          .length)
                                                  .toDouble() +
                                              80,
                                          child: GridView(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                                              children: [
                                                ..._buildTopics(
                                                    state.course.topicProgress,
                                                    context,
                                                    beforeQuizCopy)
                                              ]),
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width / 8.7,
                          top: MediaQuery.of(context).size.height / 4.3,
                          child: AnimatedContainer(
                            height: isListExpanded ? 100 : 0,
                            width: 155,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: ListView(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isListExpanded = !isListExpanded;
                                      locator<CourseProgressTracker>()
                                          .quizType = QuizType.learning;
                                    });
                                  },
                                  child: AnimatedOpacity(
                                    opacity: isListExpanded ? 1.0 : 0.0,
                                    duration: const Duration(milliseconds: 300),
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 10, left: 20),
                                      child: Text(
                                        ui_lang[locator<GlobalDataManager>()
                                            .interfaceLanguage]!['learning'],
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(color: Colors.amber),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isListExpanded = !isListExpanded;
                                      locator<CourseProgressTracker>()
                                          .quizType = QuizType.review;
                                    });
                                  },
                                  child: AnimatedOpacity(
                                    opacity: isListExpanded ? 1.0 : 0.0,
                                    duration: const Duration(milliseconds: 300),
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 20, left: 20),
                                      child: Text(
                                        ui_lang[locator<GlobalDataManager>()
                                            .interfaceLanguage]!['review'],
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(color: Colors.amber),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is CourseUpdateError) {
              DialogManager.showErrorDialog(state.error, context, () {
                context.pop();
              });
              return Container();
            } else {
              return const LoadingData();
            }
          },
        ),
      ),
    );
  }

  Container _buildCurrentCourseInformations(
      BuildContext context, ActiveCourse course, double courseProgress) {
    return Container(
      height: 180,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  ui_lang[locator<GlobalDataManager>().interfaceLanguage]![
                      course.userCourse.course.name],
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    _scrollController
                        .animateTo(
                      _scrollController.position.minScrollExtent,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    )
                        .then((value) {
                      if (isListExpanded) {
                        isListExpanded = false;
                        setState(() {});
                      } else {
                        setState(() {});
                        isListExpanded = true;
                      }
                    });

                    setState(() {});
                  },
                  child: AnimatedContainer(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: isListExpanded
                              ? Radius.zero
                              : Radius.circular(20),
                          bottomRight: isListExpanded
                              ? Radius.zero
                              : Radius.circular(20),
                        )),
                    height: 40,
                    width: 155,
                    duration: Duration(milliseconds: 20),
                    child: Center(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              child: AutoSizeText(
                                ui_lang[locator<GlobalDataManager>()
                                        .interfaceLanguage]![
                                    locator<CourseProgressTracker>().quizType ==
                                            QuizType.learning
                                        ? "learning"
                                        : "review"],
                                maxLines: 1,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(color: Colors.amber),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.amber,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 120,
            width: 120,
            child: CircularPercentageChart(
              strokeWidth: 2,
              progressColor: Colors.white,
              backgroundColor: Colors.white60,
              progress: courseProgress,
              textStyle: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.white),
              optionalWidget: SizedBox(
                height: 20,
                child: Text(
                  ui_lang[locator<GlobalDataManager>().interfaceLanguage]![
                      'completed'],
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
