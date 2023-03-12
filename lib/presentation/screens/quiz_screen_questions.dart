import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:provider/provider.dart';
import 'package:wordy/presentation/Bloc/user_progress/user_progress_bloc.dart';
import 'package:wordy/presentation/Widgets/answears_column.dart';
import 'package:wordy/presentation/Widgets/quiz_word_to_answear.dart';

import 'package:wordy/presentation/screens/quiz_finish_screen.dart';
import 'package:wordy/presentation/screens/quiz_screen.dart';
import 'package:wordy/presentation/Bloc/quiz/quiz_bloc.dart';

import '../../domain/models/quiz_question.dart';
import '../Provider/interface_language_provider.dart';
import '../Widgets/loading_data.dart';
import '../Widgets/quiz_next_button.dart';

class QuizScreenQuestions extends StatefulWidget {
  QuizScreenQuestions(
      {required this.topic,
      required this.questions,
      required this.index,
      required this.deviceSize});
  final String topic;
  final List<QuizQuestion> questions;
  final int index;
  final Size deviceSize;

  @override
  State<QuizScreenQuestions> createState() => _QuizScreenQuestionsState();
}

class _QuizScreenQuestionsState extends State<QuizScreenQuestions>
   {


 
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        if (state is LearningQuizLoaded) {
         
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
                        word: widget.questions[widget.index].question,
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: AnswearsColumn(
                        answears:
                            widget.questions[widget.index].questionOptions,
                      ),
                    ),
                    Consumer<InterfaceDataProvider>(
                      builder: (context, value, child) => Expanded(
                        flex: 2,
                        child: QuizNextButton(function: () {
                          if (widget.index == widget.questions.length - 1) {
                            
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => BlocProvider(
                                      create: (context) => QuizBloc()
                                        ..add(SessionCompleted(
                                            words: state.correct,
                                            topic: widget.topic)),
                                      child: QuizFinishScreen(
                                        correct: state.correct.length,
                                        maximum: state.questions.length,
                                        topic: widget.topic,
                                      ),
                                    ))));
                          } else {
                            context.read<QuizBloc>().add(LoadNextQuestion());
                          }
                        }),
                      ),
                    )
                  ]),
            ),
          
         
          ]);
        }

        if (state is ReviewQuizLoaded) {
          return Stack(children: [
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 60,
                    ),
                    Expanded(
                      flex: 2,
                      child: QuizWordToAnswear(
                        word: widget.questions[widget.index].question,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: AnswearsColumn(
                        answears:
                            widget.questions[widget.index].questionOptions,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: QuizNextButton(function: () {
                        if (widget.index == widget.questions.length - 1) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => BlocProvider(
                                    create: (context) => QuizBloc()
                                      ..add(ReviewCompleted(
                                          words: state.correct,
                                          topic: widget.topic)),
                                    child: QuizFinishScreen(
                                      correct: state.correct.length,
                                      maximum: state.questions.length,
                                      topic: widget.topic,
                                    ),
                                  ))));
                        } else {
                          context.read<QuizBloc>().add(LoadNextQuestion());
                        }
                      }),
                    )
                  ]),
            ),
          ]);
        } else {
          return LoadingData();
        }
      },
    );
  }
}
