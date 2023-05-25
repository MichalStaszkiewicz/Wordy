import 'dart:collection';

import 'package:achievement_view/achievement_view.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wordy/presentation/widgets/loading_data.dart';
import 'package:wordy/presentation/widgets/quiz_finish_button.dart';
import 'package:wordy/presentation/screens/quiz_screen.dart';
import 'package:wordy/const/consts.dart';

import '../../domain/models/achievement.dart';
import '../Bloc/quiz/quiz_bloc.dart';

class QuizFinishScreen extends StatefulWidget {
  QuizFinishScreen(
      {required this.topic, required this.correct, required this.maximum});
  String topic;
  int correct;
  int maximum;

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
          icon: Icon(Icons.star, color: Colors.white),
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
      create: (context) => QuizBloc()..add(FinishQuiz()),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Text(
              ui_lang['English']!['quiz_finish_header'].toString(),
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
        body: BlocBuilder<QuizBloc, QuizState>(
          builder: (context, state) {
            if (state is QuizCompleted) {
              // showNewAchievements(state.gainedAchievements);
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
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
                          Container(
                              height: 100,
                              child: Image(
                                  image: AssetImage('assets/perfect.png'))),
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
                                              ui_lang['English']![
                                                      'quiz_finish_your_score']
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall,
                                            ),
                                            Text(
                                              "${widget.correct} / ${widget.maximum}",
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
                                          "${ui_lang['English']!['quiz_finish_percentage'].toString()} ${((widget.correct / widget.maximum) * 100).toInt()}%",
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
                  QuizFinishButton(
                    function: () {
                      context.goNamed('quiz_screen',
                          queryParameters: {'topic': widget.topic});
                    },
                    label: ui_lang['English']!['quiz_finish_repeat'].toString(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  QuizFinishButton(
                    function: () {
                      context.go('/home');
                    },
                    label: ui_lang['English']!['quiz_finish_home'].toString(),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              );
            } else {
              return LoadingData();
            }
          },
        ),
      ),
    );
  }
}
