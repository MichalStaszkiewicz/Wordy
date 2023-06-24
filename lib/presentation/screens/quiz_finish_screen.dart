import 'dart:collection';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/const/app_router.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/presentation/Bloc/quiz/quiz_bloc.dart';
import 'package:wordy/presentation/widgets/bouncing_widget.dart';
import 'package:wordy/presentation/widgets/quiz_next_button.dart';

import '../../Utility/locator/service_locator.dart';
import '../../domain/models/beginner_question.dart';
import '../../domain/repositiories/stream_repository.dart';
import '../../utility/dialog_manager.dart';

class QuizFinishScreen extends StatefulWidget {
  QuizFinishScreen(
      {super.key,
      required this.topic,
      required this.score,
      required this.learnedWords});
  String topic;
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
        vsync: this, duration: const Duration(milliseconds: 600));
    _learnedWordsController = AnimationController(
        vsync: this, duration: const Duration(microseconds: 1500));
    _scoreController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    _scoreLabelController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    _learnedWordsLabelController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
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
    _scaleAnimationController
        .forward()
        .then((value) => _learnedWordsController.forward().then((value) {
              _learnedWordsLabelController.forward();
              _scoreController.forward().then((value) {
                _scoreLabelController.forward();
                _buttonOpacityController.forward();
              });
            }));
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

  bool _topicCompleted = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizBloc(locator<StreamRepository>(), ''),
      child: BlocListener<QuizBloc, QuizState>(
        listener: (context, state) {
          if (state is QuizCompleted) {
            _topicCompleted = state.topicCompleted;
          }
        },
        child: Scaffold(
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
                          widget.topic,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const SizedBox(
                            height: 100,
                            child:
                                Image(image: AssetImage('assets/perfect.png'))),
                        const SizedBox(
                          height: 50,
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Opacity(
                                    opacity: _learnedWordsAnimation.value,
                                    child: _buildStatisticWidget(
                                        context,
                                        "New learned words: ",
                                        "${_learnedWordsLabelAnimation.value.toInt()}"),
                                  ),
                                  Opacity(
                                    opacity: _scoreAnimation.value,
                                    child: _buildStatisticWidget(
                                        context,
                                        "Score ",
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
                                if (!_topicCompleted) {
                                  context.go(AppRouter.quizScreen,
                                      extra: {'topic': widget.topic});
                                } else {
                                  DialogManager.showSuccessDialog(
                                      "You have completed this module",
                                      'Congratulations !',
                                      context, () {
                                    context.go(AppRouter.selectedCourse);
                                  });
                                }
                              },
                              filled: true,
                              label: ui_lang['english']!['quiz_finish_repeat']
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
                                context.go(AppRouter.selectedCourse);
                              },
                              filled: true,
                              label: ui_lang['english']!['quiz_finish_home']
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
        ),
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
          gradient: LinearGradient(colors: [
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
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
                flex: 1,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.school),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Text(
                          score,
                          style: Theme.of(context).textTheme.labelLarge,
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
