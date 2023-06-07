import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/presentation/widgets/circular_precentage_chart.dart';
import 'package:wordy/presentation/widgets/progression_bar.dart';

import '../../domain/models/active_course.dart';
import '../../domain/models/current_course_progress.dart';
import '../Bloc/quiz/quiz_bloc.dart';
import '../widgets/selected_course_background.dart';

class SelectedCourseScreen extends StatefulWidget {
  SelectedCourseScreen({required this.currentCourse});
  CurrentCourseProgress currentCourse;
  @override
  State<SelectedCourseScreen> createState() => _SelectedCourseScreenState();
}

class _SelectedCourseScreenState extends State<SelectedCourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => QuizBloc(),
        child: CustomPaint(
          painter: SelectedCourseBackground(backgroundColor: Colors.amber),
          child: Container(
            height: 1000,
            padding: EdgeInsets.only(top: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.go('/home');
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Icon(
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
                        margin: EdgeInsets.only(right: 10),
                        height: 50,
                        width: 50,
                      )
                    ],
                  ),
                  _buildCurrentCourseInformations(context),
                  Container(
                    height: 2000,
                    child: GridView.builder(
                        itemCount: widget.currentCourse.topics.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 20, crossAxisCount: 2),
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                context.goNamed('quiz_screen',
                                    queryParameters: {
                                      'topic': 'Basic Conversation'
                                    });
                              },
                              child: _buildTopicItem(
                                  context,
                                  widget.currentCourse.topics[index].name,
                                  widget.currentCourse.topics[index].knownWords,
                                  widget
                                      .currentCourse.topics[index].wordsCount),
                            )),
                  )
                ],
              ),
            ),
          ),
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
            progress: (knownWords / totalWords) * 100,
            progressColor: Colors.blueAccent,
            width: 150,
          )
        ],
      ),
    );
  }

  Container _buildCurrentCourseInformations(BuildContext context) {
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
                  widget.currentCourse.userCourse.course.name.capitalize!,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Colors.white),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  height: 40,
                  child: Center(
                    child: Row(
                      children: [
                        Text(
                          widget.currentCourse.userCourse.difficulty.beginner
                              .name.capitalize!,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Colors.amber),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Icon(
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
                        child: Icon(
                          Icons.diamond_outlined,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
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
          Container(
            height: 120,
            width: 120,
            child: CircularPercentageChart(
              strokeWidth: 2,
              progressColor: Colors.white,
              backgroundColor: Colors.white60,
              progress: widget.currentCourse.totalProgress,
              textStyle: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.white),
              optionalWidget: Container(
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
