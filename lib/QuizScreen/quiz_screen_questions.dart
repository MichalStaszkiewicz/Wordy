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
  QuizScreenQuestions({required this.topic, required this.question,});
  final String topic;
  final QuizQuestion question;

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(
          height: 60,
        ),
        Expanded(
          flex: 2,
          child: QuizWordToAnswear(
            word: question.question,
          ),
        ),
        Expanded(
          flex: 4,
          child: AnswearsColumn(
            answears: question.questionOptions,
          ),
        ),
        Expanded(
          flex: 1,
          child: QuizNextButton(function: () {
            context.read<QuizBloc>().add(LoadNextQuestion());
            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => QuizFinishScreen(
                      correct: 20,
                      maximum: 40,
                      topic: topic,
                    ))));
          }),
        )
      ]),
    );
  }
}
