import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/const/enums.dart';
import 'package:wordy/global/course_progress_tracker.dart';
import 'package:wordy/global/global_data_manager.dart';

import '../../../../Utility/locator/service_locator.dart';

class ModeListOption extends StatefulWidget {
  ModeListOption(
      {required this.index,
      required this.currentListHeight,
      required this.quizType});
  double currentListHeight;
  QuizType quizType;
  int index;
  @override
  State<ModeListOption> createState() => _ModeListOptionState();
}

class _ModeListOptionState extends State<ModeListOption>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  bool animationForwarded = false;
  double desiredHeight = 40;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!animationForwarded &&
        widget.currentListHeight >= (widget.index * desiredHeight)) {
      controller.forward();
      animationForwarded = true;
    }

    return Consumer<CourseProgressTracker>(
      builder: (context, model, child) => Expanded(
        child: FadeTransition(
          opacity: animation,
          child: GestureDetector(
            onTap: () {
              model.setQuizType(widget.quizType);
            },
            child: Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              child: AutoSizeText(
                ui_lang[locator<GlobalDataManager>().interfaceLanguage]![
                    widget.quizType.name],
                maxLines: 1,
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.amber),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
