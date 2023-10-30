import 'package:animation_list/animation_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/Utility/locator/service_locator.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/global/global_data_manager.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: Column(
          children: [
            TitleWithBackButton(
              title: ui_lang[locator<GlobalDataManager>().interfaceLanguage]![
                  'known_words'],
            ),
            Expanded(
              child: Container(
                  child: ListView.builder(
                      itemCount: widget.beginnerProgress.length,
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              context.pushNamed(
                                  AppRouter.learnedWordsSelectedCourse,
                                  extra: {
                                    'activeCourse':
                                        widget.beginnerProgress[index]
                                  });
                            },
                            child: LearnedWordsStatisticCard(
                                maximum: widget
                                    .beginnerProgress[index].totalWordsCount,
                                current:
                                    widget.beginnerProgress[index].knownWords,
                                image: widget.beginnerProgress[index].userCourse
                                    .course.circularImage),
                          ))),
            ),
          ],
        ),
      ),
    ));
  }
}
