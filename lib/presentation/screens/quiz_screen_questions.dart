import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/presentation/widgets/answears_column.dart';
import 'package:wordy/presentation/widgets/exit_button.dart';
import 'package:wordy/presentation/widgets/progression_bar.dart';
import 'package:wordy/presentation/widgets/quiz_word_to_answear.dart';

import 'package:wordy/presentation/Bloc/quiz/quiz_bloc.dart';

import '../../Utility/dialog_manager.dart';
import '../../const/app_router.dart';
import '../../global/notification_provider.dart';
import '../widgets/quiz_next_button.dart';

class QuizScreenQuestions extends StatefulWidget {
  QuizScreenQuestions({super.key, required this.topic});
  String topic;
  @override
  State<QuizScreenQuestions> createState() => _QuizScreenQuestionsState();
}

class _QuizScreenQuestionsState extends State<QuizScreenQuestions> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        state as BeginnerQuizLoaded;

        return SafeArea(
          child: Stack(children: [
            Container(
              height: 120,
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 30,
                    child: Center(
                      child: Text(
                        widget.topic,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          child: Center(
                        child: GestureDetector(
                          onTap: () {
                            DialogManager.showQuestionDialog(
                                'If you will quit now all progress you have made will be lost!',
                                'Are you sure ? ',
                                context, () {
                              context.go(AppRouter.selectedCourse);
                            }, () {});
                          },
                          child: ExitButton(),
                        ),
                      )),
                      ProgressionBar(
                          height: 10,
                          gradient: [
                            Color.fromARGB(255, 99, 155, 252),
                            Color.fromRGBO(158, 149, 248, 1),
                          ],
                          nonProgressionColor: Colors.white,
                          progress: ((state.currentQuestionIndex + 1) /
                                  state.questions.length) *
                              100,
                          width: 250),
                      Container(
                        width: 50,
                        child: Text(
                          ' ${state.currentQuestionIndex + 1} / ${state.questions.length.toString()}',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: Color.fromARGB(255, 93, 104, 129)),
                        ),
                      )
                    ],
                  ),
                  Text('Choose the correct translation')
                ],
              ),
            ),
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 250,
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.questions[state.currentQuestionIndex]
                                  .question,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(letterSpacing: 1),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  _buildDivider(),
                                  Text(
                                    'in ${state.courseName.capitalize}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                            letterSpacing: 1,
                                            color: Color.fromARGB(
                                                255, 164, 164, 165)),
                                  ),
                                  _buildDivider(),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: AnswearsColumn(
                          answears: state
                              .questions[state.currentQuestionIndex].answers,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      height: 130,
                      child: QuizButton(
                        function: () {
                          if (state.currentQuestionIndex ==
                              state.questions.length - 1) {
                            context.pushNamed(AppRouter.quizCompleted, extra: {
                              'topic': widget.topic,
                              'maximumPoints': state.questions,
                              'correctAnswers': state.correctAnswersWordIndexes,
                            });
                          } else {
                            context.read<QuizBloc>().add(LoadNextQuestion());
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
                  ]),
            ),
          ]),
        );
      },
    );
  }

  Expanded _buildDivider() {
    return Expanded(
      child: Container(
        height: 1,
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color.fromARGB(255, 221, 221, 221)),
      ),
    );
  }
}
