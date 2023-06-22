import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/utils.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wordy/Utility/dialog_manager.dart';
import 'package:wordy/const/app_router.dart';
import 'package:wordy/const/enums.dart';
import 'package:wordy/global/notification_provider.dart';
import 'package:wordy/presentation/Bloc/quiz/quiz_bloc.dart';
import 'package:wordy/presentation/Widgets/quiz_next_button.dart';
import 'package:wordy/presentation/widgets/bouncing_widget.dart';
import 'package:wordy/presentation/widgets/exit_button.dart';
import 'package:wordy/presentation/widgets/progression_bar.dart';
import 'package:wordy/presentation/widgets/quiz_answear.dart';
import 'package:wordy/utility/utility.dart';

class QuizScreenQuestions extends StatefulWidget {
  QuizScreenQuestions({
    super.key,
    required this.topic,
  });
  String topic;

  @override
  State<QuizScreenQuestions> createState() => _QuizScreenQuestionsState();
}

class _QuizScreenQuestionsState extends State<QuizScreenQuestions>
    with TickerProviderStateMixin {
  String _buttonLabelCheck(bool checkedAnswer, int currentIndex, int maxIndex) {
    if (checkedAnswer) {
      return "Continue";
    } else if (checkedAnswer && currentIndex + 1 == maxIndex) {
      return "Finish";
    } else {
      return "Check";
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        state as BeginnerQuizLoaded;

        return Consumer<NotificationProvider>(
          builder: (context, notification, child) => SafeArea(
            child: Stack(children: [
              notification.quizAnswerNotification ?? Container(),
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
                                notification.clearChoosenAnswerNotification();
                                context.go(AppRouter.selectedCourse);
                              }, () {});
                            },
                            child: ExitButton(),
                          ),
                        )),
                        TweenAnimationBuilder(
                          builder: (BuildContext context, animation, __) =>
                              ProgressionBar(
                                  height: 10,
                                  gradient: [
                                    Color.fromARGB(255, 99, 155, 252),
                                    Color.fromRGBO(158, 149, 248, 1),
                                  ],
                                  nonProgressionColor: Colors.white,
                                  progress:
                                      ((animation) / state.questions.length) *
                                          100,
                                  width: 250),
                          duration: Duration(milliseconds: 500),
                          tween: Tween(
                              begin: state.currentQuestionIndex == 0
                                  ? 0.0000001
                                  : (state.currentQuestionIndex).toDouble(),
                              end: state.currentQuestionIndex == 0
                                  ? 0.0000002
                                  : (state.currentQuestionIndex + 1)
                                      .toDouble()),
                        ),
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
                            child: GridView.builder(
                                itemCount: state
                                    .questions[state.currentQuestionIndex]
                                    .answers
                                    .length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                itemBuilder: (BuildContext context, int index) {
                                  return AnimationConfiguration.staggeredGrid(
                                    columnCount: 2,
                                    position: index,
                                    duration: Duration(milliseconds: 375),
                                    child: BouncingWidget(
                                      onPress: () {},
                                      child: ScaleAnimation(
                                        scale: 0.1,
                                        child: QuizAnswear(
                                          answer: state
                                              .questions[
                                                  state.currentQuestionIndex]
                                              .answers[index],
                                          index: index,
                                        ),
                                      ),
                                    ),
                                  );
                                })),
                      ),
                      Consumer<NotificationProvider>(
                        builder: (context, value, child) => BouncingWidget(
                          onPress: () {},
                          child: Container(
                            alignment: Alignment.center,
                            height: 130,
                            child: QuizButton(
                              function: () {
                                Utility.quizAnswerValidationLogic(
                                    context, state, notification, widget.topic);
                              },
                              height: 50,
                              width: 350,
                              label: _buttonLabelCheck(
                                  state.answerChecked,
                                  state.currentQuestionIndex,
                                  state.questions.length),
                              margin: EdgeInsets.zero,
                              selectedAnswer:
                                  state.selectedIndex == null ? false : true,
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ]),
          ),
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
