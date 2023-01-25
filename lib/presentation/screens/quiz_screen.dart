import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordy/presentation/Widgets/exit_dialog.dart';

import 'package:wordy/presentation/screens/quiz_screen_questions.dart';


import '../Bloc/quiz/quiz_bloc.dart';


class QuizScreen extends StatefulWidget {
  QuizScreen({required this.topic});
  String topic;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  Future<bool> _onWillPop() async {
    return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return ExitDialog();
          },
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            padding: const EdgeInsets.only(right: 40),
            child: Center(
              child: Text(widget.topic,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.white)),
            ),
          ),
        ),
        body: BlocBuilder<QuizBloc, QuizState>(
          builder: (context, state) {
            if (state is QuizInitial) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is QuizLoaded) {
              return QuizScreenQuestions(
                questions: state.questions,
                index: state.index,
                topic: widget.topic,
              );
            } else {
              return const Center(
                child: Text("Something went wrong"),
              );
            }
          },
        ),
      ),
    );
  }
}
