import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordy/presentation/Widgets/answears_column.dart';
import 'package:wordy/presentation/Widgets/quiz_word_to_answear.dart';

import 'package:wordy/presentation/screens/quiz_finish_screen.dart';
import 'package:wordy/presentation/screens/quiz_screen.dart';
import 'package:wordy/presentation/Bloc/quiz/quiz_bloc.dart';

import '../../domain/models/quiz_question.dart';
import '../Widgets/quiz_next_button.dart';

class QuizScreenQuestions extends StatelessWidget {
  QuizScreenQuestions(
      {required this.topic, required this.questions, required this.index});
  final String topic;
  final List<QuizQuestion> questions;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, qstate) {
        final state = qstate as LearningQuizLoaded;
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
                    if (index == questions.length - 1) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => BlocProvider(
                                create: (context) => QuizBloc()
                                  ..add(UpdateLearnedWords(
                                      words: qstate.correct)),
                                child: QuizFinishScreen(
                                  correct: state.correct.length,
                                  maximum: state.questions.length,
                                  topic: topic,
                                ),
                              ))));
                    } else {
                      context.read<QuizBloc>().add(LoadNextQuestion());
                    }
                  }),
                )
              ]),
        );
      },
    );
  }
}
