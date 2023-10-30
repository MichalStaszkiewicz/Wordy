import 'package:animation_list/animation_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/domain/models/progress_in_topic.dart';

import '../../Utility/locator/service_locator.dart';
import '../../const/consts.dart';
import '../../domain/models/active_course.dart';
import '../../global/global_data_manager.dart';
import '../widgets/exit_button.dart';
import '../widgets/learned_words_statistic_card.dart';

class LearnedWordsSelectedCourse extends StatefulWidget {
  LearnedWordsSelectedCourse({super.key, required this.course});
  ActiveCourse course;

  @override
  State<LearnedWordsSelectedCourse> createState() =>
      _LearnedWordsSelectedCourseState();
}

class _LearnedWordsSelectedCourseState
    extends State<LearnedWordsSelectedCourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 100,
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
                                  child: const ExitButton())))),
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Center(
                        child: Text(
                          ui_lang[locator<GlobalDataManager>()
                              .interfaceLanguage]!['learned_words'],
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
            ),
            Expanded(
              child: Container(
                  child: ListView.builder(
                itemCount: widget.course.topicsCount,
                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                  child: LearnedWordsStatisticCard(
                      maximum: widget.course.totalWordsCount,
                      current: widget.course.knownWords,
                      image: widget.course.topicProgress[index].topic.image),
                ),
              )),
            ),
          ],
        ),
      ),
    ));
  }
}
