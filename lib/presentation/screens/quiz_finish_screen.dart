import 'dart:collection';

import 'package:achievement_view/achievement_view.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/const/consts.dart';

import '../../const/app_router.dart';
import '../../domain/models/achievement.dart';
import '../Bloc/quiz/quiz_bloc.dart';
import '../Widgets/quiz_next_button.dart';

class QuizFinishScreen extends StatefulWidget {
  QuizFinishScreen(
      {super.key,
      required this.topic,
      required this.correctAnswers,
      required this.maximumPoints});
  String topic;
  int maximumPoints;
  int correctAnswers;

  @override
  State<QuizFinishScreen> createState() => _QuizFinishScreenState();
}

class _QuizFinishScreenState extends State<QuizFinishScreen> {
  void showNewAchievements(List<Achievement> achievements) {
    if (achievements.isEmpty) {
      return;
    }

    final queue = ListQueue<Achievement>.from(achievements);

    void showNextAchievement() {
      if (queue.isEmpty) {
        return;
      }

      final achievement = queue.removeFirst();

      WidgetsBinding.instance.addPostFrameCallback((_) {
        AchievementView(
          context,
          title: achievement.name,
          subTitle: achievement.description,
          icon: const Icon(Icons.star, color: Colors.white),
          color: Colors.green,
        ).show();
      });

      showNextAchievement();
    }

    showNextAchievement();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizBloc(),
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
                        child: Image(image: AssetImage('assets/perfect.png'))),
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
                                margin:
                                    const EdgeInsets.only(left: 20, right: 20),
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
                                        "${widget.correctAnswers} / ${widget.maximumPoints}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: AutoSizeText(
                                    maxLines: 1,
                                    "${ui_lang['english']!['quiz_finish_percentage'].toString()} ${((widget.correctAnswers / widget.maximumPoints) * 100).toInt()}%",
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
                      QuizButton(
                        function: () {
                          context.go(AppRouter.quizScreen, extra: widget.topic);
                        },
                        label: ui_lang['english']!['quiz_finish_repeat']
                            .toString(),
                        height: 50,
                        width: 350,
                        margin: const EdgeInsets.only(bottom: 20),
                      ),
                      QuizButton(
                        function: () {
                          context.go(AppRouter.selectedCourse);
                        },
                        label:
                            ui_lang['english']!['quiz_finish_home'].toString(),
                        height: 50,
                        width: 350,
                        margin: const EdgeInsets.only(bottom: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
