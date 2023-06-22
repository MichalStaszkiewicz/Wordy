import 'dart:collection';

import 'package:achievement_view/achievement_view.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/global/notification_provider.dart';
import 'package:wordy/presentation/bloc/quiz/quiz_bloc.dart';
import 'package:wordy/presentation/widgets/bouncing_widget.dart';
import 'package:wordy/utility/dialog_manager.dart';
import 'package:wordy/utility/socket_manager.dart';

import '../../Utility/locator/service_locator.dart';
import '../../const/app_router.dart';
import '../../domain/models/achievement.dart';
import '../../domain/models/beginner_question.dart';
import '../../domain/repositiories/stream_repository.dart';
import '../../utility/toast_manager.dart';

import '../Widgets/quiz_next_button.dart';

class QuizFinishScreen extends StatefulWidget {
  QuizFinishScreen(
      {super.key,
      required this.topic,
      required this.correctAnswers,
      required this.questions});
  String topic;
  List<BeginnerQuestion> questions;
  List<int> correctAnswers;

  @override
  State<QuizFinishScreen> createState() => _QuizFinishScreenState();
}

class _QuizFinishScreenState extends State<QuizFinishScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool _topicCompleted = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizBloc(locator<StreamRepository>())
        ..add(FinishQuiz(
            wordIds: widget.correctAnswers,
            maximumPoints: widget.questions.length,
            topic: widget.topic)),
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
              Expanded(
                  child: SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Summary',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              )),
              Expanded(
                flex: 5,
                child: Container(
                  margin: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Text(
                                          maxLines: 1,
                                          ui_lang['english']![
                                                  'quiz_finish_your_score']
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall,
                                        ),
                                        Text(
                                          "${widget.correctAnswers.length} / ${widget.questions.length}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: AutoSizeText(
                                      maxLines: 1,
                                      "${ui_lang['english']!['quiz_finish_percentage'].toString()} ${((widget.correctAnswers.length / widget.questions.length) * 100).toInt()}%",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall),
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
                          child: QuizButton(
                            function: () {
                              if (!_topicCompleted) {
                                context.go(AppRouter.quizScreen,
                                    extra: widget.topic);
                              } else {
                                DialogManager.showSuccessDialog(
                                    "You have completed this module",
                                    'Congratulations !',
                                    context, () {
                                  context.go(AppRouter.selectedCourse);
                                });
                              }
                            },
                            selectedAnswer: true,
                            label: ui_lang['english']!['quiz_finish_repeat']
                                .toString(),
                            height: 50,
                            width: 350,
                            margin: const EdgeInsets.only(bottom: 0),
                          ),
                        ),
                        BouncingWidget(
                          onPress: () {},
                          child: QuizButton(
                            function: () {
                              context.go(AppRouter.selectedCourse);
                            },
                            selectedAnswer: true,
                            label: ui_lang['english']!['quiz_finish_home']
                                .toString(),
                            height: 50,
                            width: 350,
                            margin: const EdgeInsets.only(bottom: 0),
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
}
