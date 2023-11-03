import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/const/app_router.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/presentation/widgets/bouncing_widget.dart';
import 'package:wordy/presentation/widgets/button/quiz_next_button.dart';

import '../../Utility/locator/service_locator.dart';

import '../../const/urls.dart';
import '../../domain/models/topic.dart';
import '../../global/global_data_manager.dart';
import '../../utility/dialog_manager.dart';

class QuizFinishScreen extends StatefulWidget {
  QuizFinishScreen({
    super.key,
    required this.topic,
    required this.score,
    required this.learnedWords,
    required this.topicCompleted,
  });
  Topic topic;

  bool topicCompleted;
  int learnedWords;
  double score;

  @override
  State<QuizFinishScreen> createState() => _QuizFinishScreenState();
}

class _QuizFinishScreenState extends State<QuizFinishScreen>
    with TickerProviderStateMixin {
  late AnimationController _scaleAnimationController;
  late AnimationController _learnedWordsController;
  late AnimationController _scoreController;
  late AnimationController _scoreLabelController;
  late AnimationController _learnedWordsLabelController;
  late AnimationController _buttonOpacityController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _learnedWordsAnimation;
  late Animation<double> _scoreAnimation;
  late Animation<double> _scoreLabelAnimation;
  late Animation<double> _learnedWordsLabelAnimation;
  late Animation<double> _buttonOpacityAnimation;
  @override
  void initState() {
    _scaleAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _learnedWordsController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _scoreController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _scoreLabelController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    _learnedWordsLabelController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    _buttonOpacityController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _scaleAnimation =
        Tween<double>(begin: 0, end: 1.0).animate(_scaleAnimationController)
          ..addListener(() {
            setState(() {});
          });
    _buttonOpacityAnimation =
        Tween<double>(begin: 0, end: 1.0).animate(_buttonOpacityController)
          ..addListener(() {
            setState(() {});
          });
    _learnedWordsAnimation =
        Tween<double>(begin: 0, end: 1.0).animate(_learnedWordsController)
          ..addListener(() {
            setState(() {});
          });
    _scoreAnimation =
        Tween<double>(begin: 0, end: 1.0).animate(_scoreController)
          ..addListener(() {
            setState(() {});
          });
    _scoreLabelAnimation = Tween<double>(begin: 0, end: widget.score)
        .animate(_scoreLabelController)
      ..addListener(() {
        setState(() {});
      });
    _learnedWordsLabelAnimation =
        Tween<double>(begin: 0, end: 10).animate(_learnedWordsLabelController)
          ..addListener(() {
            setState(() {});
          });

    _scaleAnimationController.forward().then((value) {
      _learnedWordsLabelController.forward();
      _learnedWordsController.forward().then((value) {
        _scoreController.forward();
        _scoreLabelController.forward();
        _buttonOpacityController.forward();
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _scaleAnimationController.dispose();
    _learnedWordsController.dispose();
    _scoreController.dispose();
    _scoreLabelController.dispose();
    _learnedWordsLabelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: Container()),
          Expanded(
            flex: 5,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Container(
                margin: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Text(
                      translate[locator<GlobalDataManager>()
                              .interfaceLanguage]!['topic_label']
                          [widget.topic.name.toLowerCase()],
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                        height: 100,
                        child: Image(
                            image: NetworkImage(
                                Urls.kImageUrl + widget.topic.image))),
                    const SizedBox(
                      height: 50,
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Opacity(
                                opacity: _learnedWordsAnimation.value,
                                child: _buildStatisticWidget(
                                    context,
                                    translate[locator<GlobalDataManager>()
                                            .interfaceLanguage]![
                                        'new_learned_words'],
                                    "${_learnedWordsLabelAnimation.value.toInt()}"),
                              ),
                              Opacity(
                                opacity: _scoreAnimation.value,
                                child: _buildStatisticWidget(
                                    context,
                                    translate[locator<GlobalDataManager>()
                                                .interfaceLanguage]![
                                            'quiz_finish_your_score'] +
                                        '',
                                    "${_scoreLabelAnimation.value.toInt()} %"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              width: double.infinity,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BouncingWidget(
                      onPress: () {},
                      child: Opacity(
                        opacity: _buttonOpacityAnimation.value,
                        child: CustomAnimatedButton(
                          onTap: () {
                            if (_buttonOpacityController.isCompleted) {
                              if (!widget.topicCompleted) {
                                context.go(AppRouter.quizScreen, extra: {
                                  'topic': widget.topic,
                                });
                              } else {
                                DialogManager.showSuccessDialog(
                                    translate[locator<GlobalDataManager>()
                                        .interfaceLanguage]!['completed_topic'],
                                    translate[locator<GlobalDataManager>()
                                        .interfaceLanguage]!['congratulations'],
                                    context, () {
                                  context.go(
                                    AppRouter.selectedCourse,
                                  );
                                });
                              }
                            }
                          },
                          filled: true,
                          label: translate[locator<GlobalDataManager>()
                                  .interfaceLanguage]!['quiz_finish_repeat']
                              .toString(),
                          height: 50,
                          width: 350,
                          margin: const EdgeInsets.only(bottom: 0),
                        ),
                      ),
                    ),
                    BouncingWidget(
                      onPress: () {},
                      child: Opacity(
                        opacity: _buttonOpacityAnimation.value,
                        child: CustomAnimatedButton(
                          onTap: () {
                            if (_buttonOpacityController.isCompleted) {
                              context.go(
                                AppRouter.selectedCourse,
                              );
                            }
                          },
                          filled: true,
                          label: translate[locator<GlobalDataManager>()
                                  .interfaceLanguage]!['quiz_finish_home']
                              .toString(),
                          height: 50,
                          width: 350,
                          margin: const EdgeInsets.only(bottom: 0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildStatisticWidget(
      BuildContext context, String label, String score) {
    return Container(
      width: 300,
      height: 55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: const LinearGradient(colors: [
            Color.fromARGB(255, 99, 155, 252),
            Color.fromRGBO(158, 149, 248, 1),
          ])),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.white),
          width: 295,
          height: 50,
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Text(
                    textAlign: TextAlign.left,
                    label,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Colors.black),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: Container(child: const Icon(Icons.school))),
                      Expanded(
                        child: Container(
                          child: Text(
                            score,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
