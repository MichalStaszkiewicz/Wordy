import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wordy/Utility/locator/service_locator.dart';
import 'package:wordy/const/app_router.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/const/enums.dart';
import 'package:wordy/domain/models/active_course.dart';
import 'package:wordy/domain/models/progress_in_topic.dart';
import 'package:wordy/global/selected_course_notifier.dart';
import 'package:wordy/global/global_data_manager.dart';
import 'package:wordy/presentation/Bloc/courses_update/courses_update_bloc.dart';
import 'package:wordy/presentation/screens/selected_course_screen/selected_course_informations.dart';
import 'package:wordy/presentation/screens/selected_course_screen/mode_list/mode_list.dart';
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
  late AnimationController _courseProgressController;
  late Animation? _courseProgressAnimation;
  final ScrollController _scrollController = ScrollController();
  double topScrollPixels = 0;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
              ScrollDirection.forward ||
          _scrollController.position.userScrollDirection ==
              ScrollDirection.reverse) {
        final listState =
            Provider.of<SelectedCourseNotifier>(context, listen: false)
                .quizTypeListExpanded;
        if (listState) {
          Provider.of<SelectedCourseNotifier>(context, listen: false)
              .setQuizTypeListExpanded();
        }
      }
    });
    ActiveCourse? beforeQuiz = locator<SelectedCourseNotifier>().beforeQuiz;
    ActiveCourse? afterQuiz = locator<SelectedCourseNotifier>().afterQuiz;
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

        return Consumer<SelectedCourseNotifier>(
          builder: (context, model, child) => CustomPaint(
            painter: SelectedCourseBackground(backgroundColor: Colors.amber),
            child: SafeArea(
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        child: Stack(
                          children: [
                            NotificationListener<ScrollNotification>(
                              onNotification: (notification) {
                                topScrollPixels = notification.metrics.pixels;

                                setState(() {});

                                return true;
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 70),
                                child: CustomScrollView(
                                    controller: _scrollController,
                                    slivers: [
                                      SliverToBoxAdapter(
                                        child: SelectedCourseInformations(
                                          course: state.course,
                                          totalProgress:
                                              _courseProgressAnimation != null
                                                  ? _courseProgressAnimation!
                                                      .value
                                                  : state.course.totalProgress,
                                        ),
                                      ),
                                      SliverToBoxAdapter(
                                        child: Container(
                                          height: (110 *
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
                            SelectModeButton(
                              isListExpanded: model.quizTypeListExpanded,
                              scrollController: _scrollController,
                              top: topScrollPixels,
                            ),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                boxShadow: topScrollPixels > 30
                                    ? [
                                        BoxShadow(
                                          color:
                                              Color.fromARGB(0, 104, 104, 104)
                                                  .withOpacity(0.2),
                                          offset: const Offset(0, 8),
                                          blurRadius: 8,
                                          spreadRadius: 0,
                                        )
                                      ]
                                    : [],
                              ),
                              height: 70,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        model.setBeforeQuiz(null);
                                        model.setAfterQuiz(null);
                                        model.setQuizType(QuizType.learning);
                                        context.go(AppRouter.home);
                                      },
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        margin: const EdgeInsets.only(left: 30),
                                        child: const Icon(
                                          Icons.arrow_back_ios_new_rounded,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        translate[locator<GlobalDataManager>()
                                            .interfaceLanguage]!['course'],
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    height: 50,
                                    width: 50,
                                  )
                                ],
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
          ),
        );
      },
    );
  }
}

class SelectModeButton extends StatefulWidget {
  const SelectModeButton({
    super.key,
    required this.isListExpanded,
    required this.top,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  final bool isListExpanded;
  final ScrollController _scrollController;
  final double top;
  @override
  State<SelectModeButton> createState() => _SelectModeButtonState();
}

class _SelectModeButtonState extends State<SelectModeButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SelectedCourseNotifier>(builder: (context, model, child) {
      if (model.courseTitle != null) {
        Offset courseTitlePosition =
            model.courseTitle!;

        double buttonYPosition = courseTitlePosition.dy+20;
       

        return Positioned(
            top: buttonYPosition - widget.top.toPrecision(1) ,
            left: MediaQuery.of(context).size.width / 10,
            child: ModeList(
              scrollController: widget._scrollController,
            ));
      } else {
        return Container();
      }
    });
  }
}
