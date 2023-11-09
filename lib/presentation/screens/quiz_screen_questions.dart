import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wordy/presentation/bloc/quiz/quiz_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wordy/Utility/dialog_manager.dart';
import 'package:wordy/const/app_router.dart';
import 'package:wordy/global/global_data_manager.dart';
import 'package:wordy/global/notification_provider.dart';

import 'package:wordy/presentation/widgets/bouncing_widget.dart';
import 'package:wordy/presentation/widgets/button/exit_button.dart';

import 'package:wordy/presentation/widgets/progression_bar.dart';
import 'package:wordy/presentation/widgets/quiz_answear.dart';
import 'package:wordy/presentation/widgets/button/quiz_next_button.dart';
import 'package:wordy/presentation/widgets/read_question_widget.dart';
import 'package:wordy/utility/utility.dart';

import '../../Utility/locator/service_locator.dart';
import '../../const/consts.dart';

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
      return translate[locator<GlobalDataManager>().interfaceLanguage]![
          'continue'];
    } else if (checkedAnswer && currentIndex + 1 == maxIndex) {
      return translate[locator<GlobalDataManager>().interfaceLanguage]![
          'finish'];
    } else {
      return translate[locator<GlobalDataManager>().interfaceLanguage]![
          'check'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        state as QuizQuestionsReady;
        return Consumer<NotificationProvider>(
          builder: (context, notification, child) => SafeArea(
            child: Stack(children: [
              Container(
                height: 120,
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 30,
                      child: Center(
                        child: Text(
                          translate[locator<GlobalDataManager>()
                              .interfaceLanguage]!['topic_label'][widget.topic],
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
                                  translate[locator<GlobalDataManager>()
                                      .interfaceLanguage]!['quiting_quiz'],
                                  translate[locator<GlobalDataManager>()
                                          .interfaceLanguage]!['messages']
                                      ['are_you_sure'],
                                  context, () {
                                notification.clearChoosenAnswerNotification();
                                context.go(
                                  AppRouter.selectedCourse,
                                );
                              }, () {});
                            },
                            child: const ExitButton(),
                          ),
                        )),
                        TweenAnimationBuilder(
                          builder: (BuildContext context, animation, __) =>
                              ProgressionBar(
                                  height: 10,
                                  gradient: const [
                                    Color.fromARGB(255, 99, 155, 252),
                                    Color.fromRGBO(158, 149, 248, 1),
                                  ],
                                  nonProgressionColor:
                                      const Color.fromARGB(255, 231, 227, 227),
                                  progress: ((animation) /
                                          context
                                              .read<QuizBloc>()
                                              .questions
                                              .length) *
                                      100,
                                  width: 250),
                          duration: const Duration(milliseconds: 500),
                          tween: Tween(
                              begin: context
                                          .read<QuizBloc>()
                                          .currentQuestionIndex ==
                                      0
                                  ? 0.0000001
                                  : (context
                                          .read<QuizBloc>()
                                          .currentQuestionIndex)
                                      .toDouble(),
                              end: context
                                          .read<QuizBloc>()
                                          .currentQuestionIndex ==
                                      0
                                  ? 0.0000002
                                  : (context
                                              .read<QuizBloc>()
                                              .currentQuestionIndex +
                                          1)
                                      .toDouble()),
                        ),
                        Container(
                          width: 60,
                          child: Text(
                            ' ${context.read<QuizBloc>().currentQuestionIndex + 1} / ${context.read<QuizBloc>().questions.length.toString()}',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                    color: const Color.fromARGB(
                                        255, 93, 104, 129)),
                          ),
                        )
                      ],
                    ),
                    Text(translate[locator<GlobalDataManager>()
                        .interfaceLanguage]!['choose_correct_translation'])
                  ],
                ),
              ),
              Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(child:  Container()),
                                    Container(
                                      width: 15,
                                    ),
                                    Expanded(flex: 5,
                                      child: Container(
                                        child: AutoSizeText(
                                          maxLines: 1,
                                          textAlign: TextAlign.center,
                                          context
                                              .read<QuizBloc>()
                                              .questions[context
                                                  .read<QuizBloc>()
                                                  .currentQuestionIndex]
                                              .question,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(letterSpacing: 1),
                                        ),
                                      ),
                                    ),
                                Expanded(child: Container())
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      _buildDivider(),
                                      Text(
                                        translate[locator<GlobalDataManager>()
                                                .interfaceLanguage]!['in'] +
                                            ' ${translate[locator<GlobalDataManager>().interfaceLanguage]!['${context.read<QuizBloc>().courseName}_quiz']}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .copyWith(
                                                letterSpacing: 1,
                                                color: const Color.fromARGB(
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
                      ),
                      Expanded(
                        flex: 7,
                        child: Container(
                            child: GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: context
                                    .read<QuizBloc>()
                                    .questions[context
                                        .read<QuizBloc>()
                                        .currentQuestionIndex]
                                    .answers
                                    .length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                itemBuilder: (BuildContext context, int index) {
                                  return AnimationConfiguration.staggeredGrid(
                                    columnCount: 2,
                                    position: index,
                                    duration: const Duration(milliseconds: 375),
                                    child: BouncingWidget(
                                      onPress: () {},
                                      child: QuizAnswear(
                                        answer: context
                                            .read<QuizBloc>()
                                            .questions[context
                                                .read<QuizBloc>()
                                                .currentQuestionIndex]
                                            .answers[index],
                                        index: index,
                                      ),
                                    ),
                                  );
                                })),
                      ),
                    ]),
              ),
              notification.quizAnswerNotification ?? Container(),
              Consumer<NotificationProvider>(
                builder: (context, value, child) => Transform.translate(
                  offset: Offset(0, MediaQuery.of(context).size.height / 1.25),
                  child: BouncingWidget(
                    onPress: () {},
                    child: Container(
                      alignment: Alignment.center,
                      height: 130,
                      child: CustomAnimatedButton(
                        onTap: () {
                          Utility.quizAnswerValidationLogic(
                              context, state, notification, widget.topic);
                        },
                        height: 50,
                        width: 350,
                        label: _buttonLabelCheck(
                            state.answerChecked,
                            context.read<QuizBloc>().currentQuestionIndex,
                            context.read<QuizBloc>().questions.length),
                        margin: EdgeInsets.zero,
                        filled: state.selectedIndex == null ? false : true,
                      ),
                    ),
                  ),
                ),
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
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color.fromARGB(255, 221, 221, 221)),
      ),
    );
  }
}
