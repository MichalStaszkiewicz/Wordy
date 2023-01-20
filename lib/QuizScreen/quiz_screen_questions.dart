import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordy/Bloc/quiz/quiz_bloc.dart';
import 'package:wordy/QuizScreen/quiz_finish_screen.dart';
import 'package:wordy/QuizScreen/quiz_next_button.dart';
import 'package:wordy/QuizScreen/quiz_screen.dart';
import 'package:wordy/QuizScreen/quiz_word_to_answear.dart';

import '../models/quiz_question.dart';
import 'answears_column.dart';

class QuizScreenQuestions extends StatelessWidget {
  QuizScreenQuestions(
      {required this.topic, required this.questions, required this.index});
  final String topic;
  final List<QuizQuestion> questions;
  final index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, qstate) {
        final state = qstate as QuizLoaded;
        return Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 60,
                ),
                Expanded(
                  flex: 2,
                  child: QuizWordToAnswear(
                    word: questions[index].question,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: AnswearsColumn(
                    answears: questions[index].questionOptions,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: QuizNextButton(function: () {
                    context.read<QuizBloc>().add(LoadNextQuestion());
                    if (index == questions.length - 2) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => QuizFinishScreen(
                                correct: state.correct,
                                maximum: state.questions.length,
                                topic: topic,
                              ))));
                    }
                  }),
                )
              ]),
        );
      },
    );
  }
}
