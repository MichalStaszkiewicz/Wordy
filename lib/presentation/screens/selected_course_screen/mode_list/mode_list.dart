import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wordy/Utility/locator/service_locator.dart';
import 'package:wordy/const/app_router.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/const/enums.dart';
import 'package:wordy/global/course_progress_tracker.dart';
import 'package:wordy/global/global_data_manager.dart';
import 'package:wordy/presentation/screens/selected_course_screen/mode_list/mode_list_option.dart';

import '../../../widgets/selected_course_background.dart';

class ModeList extends StatefulWidget {
  ModeList(
      {super.key,
      required this.isListExpanded,
      required this.scrollController});
  bool isListExpanded;
  ScrollController scrollController;

  @override
  State<ModeList> createState() => _ModeListState();
}

class _ModeListState extends State<ModeList> {
  final Duration _listAnimationDuration = const Duration(milliseconds: 200);
  @override
  Widget build(BuildContext context) {
    return Consumer<CourseProgressTracker>(
      builder: (context, model, child) => GestureDetector(
        onTap: () {
          
          widget.scrollController
              .animateTo(
            widget.scrollController.position.minScrollExtent,
            duration: const Duration(milliseconds: 300),
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
        },
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
            duration: _listAnimationDuration,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          child: AutoSizeText(
                            translate[locator<GlobalDataManager>()
                                    .interfaceLanguage]![
                               model.quizType.name],
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
                  duration: _listAnimationDuration,
                  child: LayoutBuilder(builder: (context, constraints) {
                    double currentHeight = constraints.maxHeight;

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        widget.isListExpanded
                            ? ModeListOption(
                                index: 1,
                                currentListHeight: currentHeight,
                                quizType: QuizType.learning,
                              )
                            : Container(),
                        widget.isListExpanded
                            ? ModeListOption(
                                index: 2,
                                currentListHeight: currentHeight,
                                quizType: QuizType.review,
                              )
                            : Container(),
                      ],
                    );
                  }),
                ),
              ],
            )),
      ),
    );
  }
}
