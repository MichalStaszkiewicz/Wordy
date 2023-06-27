import 'package:animation_list/animation_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/const/consts.dart';

import '../../const/app_router.dart';
import '../../domain/models/active_course.dart';
import '../widgets/learned_words_statistic_card.dart';
import '../widgets/title_with_back_button.dart';

class WordsLearnedScreen extends StatefulWidget {
  WordsLearnedScreen({super.key, required this.beginnerProgress});
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
          context.pushNamed(AppRouter.learnedWordsSelectedCourse,
              extra: {'activeCourse': course});
        },
        child: LearnedWordsStatisticCard(
            maximum: course.totalWordsCount,
            current: course.knownWords,
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
            TitleWithBackButton(
              title: ui_lang['polish']!['known_words'],
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
