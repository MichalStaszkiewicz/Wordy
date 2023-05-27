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
        return SafeArea(
          child: Stack(children: [
            Container(
              height: 50,
              alignment: Alignment.topCenter,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                        child: Center(
                      child: GestureDetector(
                        onTap: () {
                          context.go('/selected_course');
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                    )),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Center(
                        child: Text(
                          widget.topic,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      //implement timer here
                      height: MediaQuery.of(context).size.height / 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Center(
                          child: QuizWordToAnswear(
                            word: state
                                .questions[state.currentQuestionIndex].question,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: AnswearsColumn(
                          answears: state
                              .questions[state.currentQuestionIndex].answers,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Center(
                          child: QuizButton(
                            function: () {
                              if (state.currentQuestionIndex ==
                                  state.questions.length - 1) {
                                context.read<QuizBloc>().add(FinishQuiz(
                                    wordIds: state.correctAnswersWordIndexes,
                                    maximumPoints: state.questions.length));
                                context.goNamed('quiz_screen_completed',
                                    queryParameters: {
                                      'topic': widget.topic,
                                      'maximumPoints':
                                          state.questions.length.toString(),
                                      'correctAnswers': state
                                          .correctAnswersWordIndexes.length
                                          .toString(),
                                    });
                              } else {
                                context
                                    .read<QuizBloc>()
                                    .add(LoadNextQuestion());
                              }
                            },
                            height: 50,
                            width: 350,
                            label: state.currentQuestionIndex ==
                                    state.questions.length - 1
                                ? 'Finish'
                                : 'Next Question',
                            margin: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ]),
        );
      },
    );
  }
}
