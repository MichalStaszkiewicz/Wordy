import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wordy/const/app_router.dart';
import 'package:wordy/const/enums.dart';
import 'package:wordy/const/urls.dart';
import 'package:wordy/domain/models/active_course.dart';
import 'package:wordy/domain/models/progress_in_topic.dart';
import 'package:wordy/utility/locator/service_locator.dart';

import '../../Utility/dialog_manager.dart';
import '../../const/consts.dart';
import '../../domain/models/topic.dart';
import '../../global/selected_course_notifier.dart';
import 'package:wordy/global/global_data_manager.dart';

import 'progression_bar.dart';

class SelectedCourseTopicCard extends StatefulWidget {
  SelectedCourseTopicCard({
    super.key,
    required this.progress,
    required this.beforeQuiz,
    required this.topic,
  });
  ProgressInTopic progress;
  Topic topic;
  ActiveCourse? beforeQuiz;

  @override
  State<SelectedCourseTopicCard> createState() =>
      _SelectedCourseTopicCardState();
}

class _SelectedCourseTopicCardState extends State<SelectedCourseTopicCard>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  Animation? _animation;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    ActiveCourse? afterQuiz = locator<SelectedCourseNotifier>().afterQuiz;
    if (widget.beforeQuiz != null && afterQuiz != null) {
      ProgressInTopic progressBeforeQuiz = widget.beforeQuiz!.topicProgress
          .firstWhere((element) => element.name == widget.progress.name);
      ProgressInTopic progressAfterQuiz = afterQuiz.topicProgress
          .firstWhere((element) => element.name == widget.progress.name);
      _animation = IntTween(
              begin: progressBeforeQuiz.knownWords,
              end: progressAfterQuiz.knownWords)
          .animate(_animationController)
        ..addListener(() {
          setState(() {});
        });
    }
    if (_animation != null) {
      _animationController.forward();
    }
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectedCourseNotifier>(
      builder: (context, model, child) => GestureDetector(
        onTap: () {
          var quizType = locator<SelectedCourseNotifier>().quizType;

          if (quizType.name.toLowerCase() ==
                  QuizType.learning.name.toLowerCase() &&
              widget.progress.knownWords < widget.progress.wordsCount) {
            locator<SelectedCourseNotifier>().beforeQuiz = widget.beforeQuiz;
            context.pushNamed(AppRouter.quizScreen, extra: {
              'topic': widget.topic,
            });
          } else if (quizType.name.toLowerCase() ==
                  QuizType.learning.name.toLowerCase() &&
              widget.progress.knownWords == widget.progress.wordsCount) {
            DialogManager.showSuccessDialog(
                translate[locator<GlobalDataManager>().interfaceLanguage]![
                        'finished_topic_announcement'] +
                    " ${translate[locator<GlobalDataManager>().interfaceLanguage]!['topic_label'][widget.topic.name]}",
                translate[locator<GlobalDataManager>().interfaceLanguage]![
                    'congratulations'],
                context,
                () {});
          } else {
            context.pushNamed(AppRouter.quizScreen,
                extra: {'topic': widget.topic});
          }
        },
        child: Container(
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
                child: Center(
                    child: Image(
                        image: NetworkImage(
                            locator<Urls>().imageUrl + widget.topic.image))),
              ),
              Text(
                translate[locator<GlobalDataManager>().interfaceLanguage]![
                    'topic_label'][widget.progress.name],
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.black45),
              ),
              RichText(
                  text: TextSpan(
                children: [
                  TextSpan(
                    text: _animation != null
                        ? '${_animation!.value} /'
                        : "${widget.progress.knownWords} / ",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.black45),
                  ),
                  TextSpan(
                    text: ' ${widget.progress.wordsCount}',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Colors.black45),
                  ),
                ],
              )),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: ProgressionBar(
                  height: 10,
                  gradient: const [
                    Color.fromARGB(255, 99, 155, 252),
                    Color.fromRGBO(158, 149, 248, 1),
                  ],
                  nonProgressionColor: Colors.white,
                  progress: _animation != null
                      ? (_animation!.value / widget.progress.wordsCount) * 100
                      : (widget.progress.knownWords /
                              widget.progress.wordsCount) *
                          100,
                  width: 150,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
