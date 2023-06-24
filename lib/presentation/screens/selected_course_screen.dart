import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wordy/const/app_router.dart';
import 'package:wordy/global/course_progress_tracker.dart';

import 'package:wordy/presentation/widgets/circular_precentage_chart.dart';
import 'package:wordy/presentation/widgets/loading_data.dart';
import 'package:wordy/presentation/widgets/progression_bar.dart';
import 'package:wordy/presentation/widgets/selected_course_topic_card.dart';
import 'package:wordy/utility/dialog_manager.dart';

import '../../Utility/locator/service_locator.dart';
import '../../domain/models/active_course.dart';

import '../../domain/models/progress_in_topic.dart';
import '../../domain/repositiories/stream_repository.dart';

import '../../global/notification_provider.dart';
import '../bloc/courses_update/courses_update_bloc.dart';
import '../widgets/selected_course_background.dart';

class SelectedCourseScreen extends StatefulWidget {
  const SelectedCourseScreen({super.key});

  @override
  State<SelectedCourseScreen> createState() => _SelectedCourseScreenState();
}

class _SelectedCourseScreenState extends State<SelectedCourseScreen>
    with TickerProviderStateMixin {
  late AnimationController _courseProgressController;
  late Animation? _courseProgressAnimation;
  void initState() {
    ActiveCourse? beforeQuiz = locator<CourseProgressTracker>().beforeQuiz;
    ActiveCourse? afterQuiz = locator<CourseProgressTracker>().afterQuiz;
    _courseProgressController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    if (beforeQuiz == null || afterQuiz == null) {
      _courseProgressAnimation = null;
    } else {
      _courseProgressAnimation = Tween<double>(
              begin: beforeQuiz!.totalProgress ?? 0,
              end: afterQuiz!.totalProgress ?? 0)
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

  void dispose() {
    _courseProgressController.dispose();
    super.dispose();
  }

  List<SelectedCourseTopicCard> _buildTopics(List<ProgressInTopic> progress,
      BuildContext context, ActiveCourse? course) {
    List<SelectedCourseTopicCard> result = [];
    for (ProgressInTopic topic in progress) {
      result.add(SelectedCourseTopicCard(
        progress: topic,
        beforeQuiz: course,
      ));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CoursesUpdateBloc(locator<StreamRepository>())
          ..add(CurrentCourseInitial()),
        child: BlocBuilder<CoursesUpdateBloc, CoursesUpdateState>(
          builder: (context, state) {
            if (state is CourseTopicsLoaded) {
              var beforeQuizCopy;
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
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            child: CustomScrollView(slivers: [
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
                                        context.go(AppRouter.home);
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: const Icon(
                                          Icons.arrow_back_ios_new_rounded,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Course',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(color: Colors.white),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(right: 10),
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
                                        ? _courseProgressAnimation!.value
                                        : state.course.totalProgress),
                              ),
                              SliverToBoxAdapter(
                                child: Container(
                                  height:
                                      (150 * state.course.topicProgress.length)
                                              .toDouble() +
                                          80,
                                  child: GridView(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      children: [
                                        ..._buildTopics(
                                            state.course.topicProgress,
                                            context,
                                            beforeQuizCopy)
                                      ],
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2)),
                                ),
                              ),
                            ]),
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
                  course.userCourse.course.name.capitalize!,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Colors.white),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  height: 40,
                  child: Center(
                    child: Row(
                      children: [
                        Text(
                          'Learning',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Colors.amber),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.amber,
                          ),
                        )
                      ],
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
                  'completed',
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
