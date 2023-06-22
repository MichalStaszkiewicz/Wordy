import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wordy/const/app_router.dart';

import 'package:wordy/presentation/widgets/circular_precentage_chart.dart';
import 'package:wordy/presentation/widgets/loading_data.dart';
import 'package:wordy/presentation/widgets/progression_bar.dart';
import 'package:wordy/utility/dialog_manager.dart';

import '../../Utility/locator/service_locator.dart';
import '../../domain/models/active_course.dart';

import '../../domain/repositiories/stream_repository.dart';

import '../../global/notification_provider.dart';
import '../bloc/courses_update/courses_update_bloc.dart';
import '../widgets/selected_course_background.dart';

class SelectedCourseScreen extends StatefulWidget {
  const SelectedCourseScreen({super.key});

  @override
  State<SelectedCourseScreen> createState() => _SelectedCourseScreenState();
}

class _SelectedCourseScreenState extends State<SelectedCourseScreen> {
  void initState() {
    super.initState();
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
              return CustomPaint(
                painter:
                    SelectedCourseBackground(backgroundColor: Colors.amber),
                child: Container(
                  height: 1000,
                  padding: const EdgeInsets.only(top: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        _buildCurrentCourseInformations(context, state.course),
                        SizedBox(
                          height: 2000,
                          child: GridView.builder(
                              itemCount: state.course.topicProgress.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 20, crossAxisCount: 2),
                              itemBuilder: (context, index) => GestureDetector(
                                    onTap: () {
                                      print(state
                                          .course.topicProgress[index].name);
                                      if (state.course.topicProgress[index]
                                              .knownWords <
                                          state.course.topicProgress[index]
                                              .wordsCount) {
                                        context.go(AppRouter.quizScreen,
                                            extra: state.course
                                                .topicProgress[index].name);
                                      } else {
                                        DialogManager.showSuccessDialog(
                                            'You have been Completed this topic. if you would like to repeat them you can do this in review mode',
                                            'Congratulations !',
                                            context,
                                            () {});
                                      }
                                    },
                                    child: _buildTopicItem(
                                        context,
                                        state.course.topicProgress[index].name,
                                        state.course.topicProgress[index]
                                            .knownWords,
                                        state.course.topicProgress[index]
                                            .wordsCount),
                                  )),
                        )
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

  Container _buildTopicItem(
      BuildContext context, String name, int knownWords, int totalWords) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(40, 190, 64, 240),
            offset: Offset(0, 6),
            blurRadius: 6.0,
          )
        ],
      ),
      height: 150,
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(108, 204, 132, 233),
                  offset: Offset(0, 6),
                  blurRadius: 6.0,
                )
              ],
            ),
            child: const Center(
              child: Icon(
                Icons.apple_outlined,
                color: Colors.blueAccent,
              ),
            ),
          ),
          Text(
            name,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.black45),
          ),
          RichText(
              text: TextSpan(
            children: [
              TextSpan(
                text: '$knownWords /',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.black45),
              ),
              TextSpan(
                text: ' $totalWords',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.black45),
              ),
            ],
          )),
          ProgressionBar(
            height: 10,
            gradient: [
              Color.fromARGB(255, 99, 155, 252),
              Color.fromRGBO(158, 149, 248, 1),
            ],
            nonProgressionColor: Colors.white,
            progress: (knownWords / totalWords) * 100,
            width: 150,
          )
        ],
      ),
    );
  }

  Container _buildCurrentCourseInformations(
      BuildContext context, ActiveCourse course) {
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
                          course
                              .userCourse.difficulty.beginner.name.capitalize!,
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
                Container(
                  child: Row(
                    children: [
                      Container(
                        child: const Icon(
                          Icons.diamond_outlined,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '2 milestones',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                )
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
              progress: course.totalProgress,
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
