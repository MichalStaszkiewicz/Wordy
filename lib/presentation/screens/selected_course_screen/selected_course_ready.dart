import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/Utility/locator/service_locator.dart';
import 'package:wordy/const/app_router.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/const/enums.dart';
import 'package:wordy/domain/models/active_course.dart';
import 'package:wordy/domain/models/progress_in_topic.dart';
import 'package:wordy/global/course_progress_tracker.dart';
import 'package:wordy/global/global_data_manager.dart';
import 'package:wordy/presentation/Bloc/courses_update/courses_update_bloc.dart';
import 'package:wordy/presentation/screens/selected_course_screen/selected_course_informations.dart';
import 'package:wordy/presentation/screens/selected_course_screen/selected_course_mode_list.dart';
import 'package:wordy/presentation/widgets/selected_course_topic_card.dart';

import '../../widgets/selected_course_background.dart';

class SelectedCourseReady extends StatefulWidget {
  SelectedCourseReady({required this.beforeQuizCopy});
  ActiveCourse? beforeQuizCopy;
  @override
  State<SelectedCourseReady> createState() => _SelectedCourseReadyState();
}

class _SelectedCourseReadyState extends State<SelectedCourseReady>
    with TickerProviderStateMixin {
  bool isListExpanded = false;
  late AnimationController _courseProgressController;
  late Animation? _courseProgressAnimation;
  final ScrollController _scrollController = ScrollController();

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
    return BlocBuilder<CoursesUpdateBloc, CoursesUpdateState>(
      builder: (context, courseState) {
        final state = courseState as CourseTopicsLoaded;

        return CustomPaint(
          painter: SelectedCourseBackground(backgroundColor: Colors.amber),
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
                                              .quizType = QuizType.learning;
                                          context.go(AppRouter.home);
                                        },
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(left: 10),
                                          child: const Icon(
                                            Icons.arrow_back_ios_new_rounded,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        ui_lang[locator<GlobalDataManager>()
                                            .interfaceLanguage]!['course'],
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(color: Colors.white),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        height: 50,
                                        width: 50,
                                      )
                                    ],
                                  ),
                                ),
                                SliverToBoxAdapter(
                                  child: SelectedCourseInformations(
                                    course: state.course,
                                    totalProgress:
                                        _courseProgressAnimation != null
                                            ? _courseProgressAnimation!.value
                                            : state.course.totalProgress,
                                  ),
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
                                              widget.beforeQuizCopy)
                                        ]),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      top: MediaQuery.of(context).size.height / 4.8,
                      left: MediaQuery.of(context).size.width / 10,
                      child: SelectedCourseModeList(
                        isListExpanded: isListExpanded,
                        scrollController: _scrollController,
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
