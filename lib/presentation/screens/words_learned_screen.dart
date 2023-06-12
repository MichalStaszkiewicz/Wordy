import 'package:animation_list/animation_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/const/urls.dart';
import 'package:wordy/presentation/widgets/exit_button.dart';
import 'package:wordy/presentation/widgets/progression_bar.dart';

import '../../const/app_router.dart';
import '../../domain/models/active_course.dart';
import '../bloc/profile/profile_bloc.dart';
import '../widgets/learned_words_statistic_card.dart';
import '../widgets/loading_data.dart';

class WordsLearnedScreen extends StatefulWidget {
  WordsLearnedScreen({required this.beginnerProgress});
  List<ActiveCourse> beginnerProgress;
  @override
  State<WordsLearnedScreen> createState() => _WordsLearnedScreenState();
}

class _WordsLearnedScreenState extends State<WordsLearnedScreen> {
  List<GestureDetector> _buildStats(BuildContext context) {
    List<GestureDetector> list = [];
    for (ActiveCourse course in widget.beginnerProgress) {
      list.add(GestureDetector(
        onTap: () {
          context.pushNamed(AppRouter.learnedWordsSelectedCourseNamed,
              extra: {'activeCourse': course});
        },
        child: LearnedWordsStatisticCard(
            maximum: course.totalWordsCount,
            current: course.wordsLearned,
            image: course.userCourse.course.circularImage),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: Column(
          children: [
            Container(
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: Container(
                          child: Center(
                              child: GestureDetector(
                                  onTap: () {
                                    context.pop();
                                  },
                                  child: ExitButton())))),
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Center(
                        child: Text(
                          'Learned Words',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              )),
              height: 100,
            ),
            Expanded(
              child: Container(
                  child: AnimationList(
                duration: 1500,
                reBounceDepth: 10,
                children: [..._buildStats(context)],
              )),
            ),
          ],
        ),
      ),
    ));
  }
}
