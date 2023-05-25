import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:wordy/presentation/widgets/exit_dialog.dart';
import 'package:wordy/presentation/widgets/loading_data.dart';

import 'package:wordy/presentation/screens/quiz_screen_questions.dart';
import 'package:wordy/const/consts.dart';

import '../Bloc/quiz/quiz_bloc.dart';
import '../widgets/unexpected_error.dart';

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
    return BlocProvider(
      create: (context) =>
          QuizBloc()..add(LoadBeginnerQuiz(topic: widget.topic)),
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          appBar: AppBar(
            title: Container(
              padding: const EdgeInsets.only(right: 20),
              child: Center(
                child: Text(widget.topic,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: Colors.white)),
              ),
            ),
          ),
          body: Container(
            child: BlocBuilder<QuizBloc, QuizState>(
              builder: (context, state) {
                if (state is InProgress || state is QuizInitial) {
                  return LoadingData();
                } else if (state is BeginnerQuizLoaded) {
                  return QuizScreenQuestions(
                    topic: widget.topic,
                  );
                } else {
                  return UnexpectedError();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
