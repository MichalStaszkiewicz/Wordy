import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordy/presentation/Bloc/quiz/quiz_bloc.dart';

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
      builder: (context, qstate) {
        final state = qstate as QuizLoaded;

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
              child: Text(
                widget.answer,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ),
        );
      },
    );
  }
}
