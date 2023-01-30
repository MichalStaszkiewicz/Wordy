import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordy/presentation/Widgets/exit_dialog.dart';

import 'package:wordy/presentation/screens/quiz_screen_questions.dart';
import 'package:wordy/shared/consts.dart';

import '../Bloc/quiz/quiz_bloc.dart';
import '../Widgets/unexpected_error.dart';

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
            if (state is LearningQuizLoaded) {
              if (state.questions.isEmpty) {
                return Center(
                  child: Text(
                      '${ui_lang[userLanguage]!['finished_topic_announcement'].toString()} ${widget.topic}'),
                );
              } else {
                return QuizScreenQuestions(
                  questions: state.questions,
                  index: state.index,
                  topic: widget.topic,
                );
              }
            }

            if (state is ReviewQuizLoaded) {
              if (state.questions.isEmpty) {
                return Center(
                  child: Text(
                      ui_lang[userLanguage]!['no_words_to_review_announcement'].toString()),
                );
              } else {
                return QuizScreenQuestions(
                  questions: state.questions,
                  index: state.index,
                  topic: widget.topic,
                );
              }
            } else {
              return  UnexpectedError();
            }
          },
        ),
      ),
    );
  }
}
