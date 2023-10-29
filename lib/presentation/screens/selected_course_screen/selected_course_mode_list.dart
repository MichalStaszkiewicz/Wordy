import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/Utility/locator/service_locator.dart';
import 'package:wordy/const/app_router.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/const/enums.dart';
import 'package:wordy/global/course_progress_tracker.dart';
import 'package:wordy/global/global_data_manager.dart';

import '../../widgets/selected_course_background.dart';

class SelectedCourseModeList extends StatefulWidget {
   SelectedCourseModeList({required this.isListExpanded, required this.scrollController});
  bool isListExpanded;
  ScrollController scrollController;


  @override
  State<SelectedCourseModeList> createState() => _SelectedCourseModeListState();
}

class _SelectedCourseModeListState extends State<SelectedCourseModeList> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
        widget.scrollController
            .animateTo(
          widget.scrollController.position.minScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        )
            .then((value) {
          if (widget.isListExpanded) {
            widget.isListExpanded = false;
            setState(() {});
          } else {
            setState(() {});
            widget.isListExpanded = true;
          }
        });

        setState(() {});
      }, //TODO: Reference for selected labels
      child: AnimatedContainer(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
          height: widget.isListExpanded ? 120 : 40,
          width: 155,
          duration: Duration(milliseconds: 500),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40,
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
              AnimatedContainer(
                height: widget.isListExpanded ? 80 : 0,
                duration: Duration(milliseconds: 500),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    widget.isListExpanded
                        ? Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              width: double.infinity,
                              child: AutoSizeText(
                                ui_lang[locator<GlobalDataManager>()
                                        .interfaceLanguage]![
                                    locator<CourseProgressTracker>().quizType ==
                                            QuizType.learning
                                        ? "learning"
                                        : "review"],
                                maxLines: 1,
                                textAlign: TextAlign.start,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(color: Colors.amber),
                              ),
                            ),
                          )
                        : Container(),
                    widget.isListExpanded
                        ? Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              width: double.infinity,
                              child: AutoSizeText(
                                ui_lang[locator<GlobalDataManager>()
                                        .interfaceLanguage]![
                                    locator<CourseProgressTracker>().quizType ==
                                            QuizType.review
                                        ? "learning"
                                        : "review"],
                                maxLines: 1,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(color: Colors.amber),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
