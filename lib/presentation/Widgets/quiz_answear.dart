import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordy/presentation/Bloc/quiz/quiz_bloc.dart';
import 'package:wordy/presentation/Widgets/loading_data.dart';

class QuizAnswear extends StatefulWidget {
  QuizAnswear({required this.answer, required this.index});
  String answer;
  int index;

  @override
  State<QuizAnswear> createState() => _QuizAnswearState();
}

class _QuizAnswearState extends State<QuizAnswear> {
  Color colorCheck(int indicator) {
    if (indicator == 0) {
      return Colors.white;
    }
    if (indicator == 1) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        if (state is LearningQuizLoaded) {
          return GestureDetector(
            onTap: () {
              if (state.selected == false) {
                context.read<QuizBloc>().add(SelectAnswer(index: widget.index));
              }
            },
            child: Container(
              margin: const EdgeInsets.all(20),
              height: 100,
              decoration: BoxDecoration(
                color: colorCheck(state.question_answer_state[widget.index]),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Center(
                child: AutoSizeText(
                  widget.answer,
                  maxLines: 1,
                  minFontSize: 15,
                  maxFontSize: 20,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
          );
        }
        if (state is ReviewQuizLoaded) {
          return GestureDetector(
            onTap: () {
              if (state.selected == false) {
                context.read<QuizBloc>().add(SelectAnswer(index: widget.index));
              }
            },
            child: Container(
              margin: const EdgeInsets.all(20),
              height: 100,
              decoration: BoxDecoration(
                color: colorCheck(state.question_answer_state[widget.index]),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Center(
                child: AutoSizeText(
                  widget.answer,
                  maxLines: 1,
                  minFontSize: 15,
                  maxFontSize: 20,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
          );
        } else {
          return LoadingData();
        }
      },
    );
  }
}
