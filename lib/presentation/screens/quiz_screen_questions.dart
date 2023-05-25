import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wordy/presentation/Bloc/user_progress/user_progress_bloc.dart';
import 'package:wordy/presentation/widgets/answears_column.dart';
import 'package:wordy/presentation/widgets/quiz_word_to_answear.dart';

import 'package:wordy/presentation/screens/quiz_finish_screen.dart';
import 'package:wordy/presentation/screens/quiz_screen.dart';
import 'package:wordy/presentation/Bloc/quiz/quiz_bloc.dart';

import '../../domain/models/quiz_question.dart';
import '../widgets/loading_data.dart';
import '../widgets/quiz_next_button.dart';

class QuizScreenQuestions extends StatefulWidget {
  QuizScreenQuestions({required this.topic});
  String topic;
  @override
  State<QuizScreenQuestions> createState() => _QuizScreenQuestionsState();
}

class _QuizScreenQuestionsState extends State<QuizScreenQuestions> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        state as BeginnerQuizLoaded;
        return Stack(children: [
          Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 10,
                  ),
                  Expanded(
                    flex: 3,
                    child: QuizWordToAnswear(
                      word:
                          state.questions[state.currentQuestionIndex].question,
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: AnswearsColumn(
                      answears:
                          state.questions[state.currentQuestionIndex].answers,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: QuizNextButton(function: () {
                      if (state.currentQuestionIndex ==
                          state.questions.length - 1) {
                        context.goNamed('quiz_screen_completed',
                            queryParameters: {
                              'topic': widget.topic,
                              'maximum': 10.toString(),
                              'correct': 2.toString()
                            });
                      } else {
                        context.read<QuizBloc>().add(LoadNextQuestion());
                      }
                    }),
                  ),
                ]),
          ),
        ]);
      },
    );
  }
}
