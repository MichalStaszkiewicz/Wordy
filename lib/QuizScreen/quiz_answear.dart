import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/quiz/quiz_bloc.dart';

class QuizAnswear extends StatefulWidget {
  QuizAnswear({required this.answer});
  String answer;

  @override
  State<QuizAnswear> createState() => _QuizAnswearState();
}

class _QuizAnswearState extends State<QuizAnswear> {
  Color color = Colors.white;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, qstate) {
        final state = qstate as QuizLoaded;
        return GestureDetector(
          onTap: () {
            if (widget.answer == state.questions[state.index].answer) {
              color = Colors.green;
            } else {
              color = Colors.red;
            }
          },
          child: Container(
            margin: const EdgeInsets.all(20),
            height: 100,
            decoration: BoxDecoration(
              color: color,
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
