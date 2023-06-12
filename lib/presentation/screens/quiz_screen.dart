import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:wordy/presentation/widgets/loading_data.dart';

import 'package:wordy/presentation/screens/quiz_screen_questions.dart';

import '../../Utility/dialog_manager.dart';
import '../../data/network/exceptions/exception_helper.dart';
import '../../data/network/exceptions/unexpected_error.dart';
import '../Bloc/quiz/quiz_bloc.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen({super.key, required this.topic});
  String topic;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          QuizBloc()..add(LoadBeginnerQuiz(topic: widget.topic)),
      child: Scaffold(
        body: Container(
          child: BlocBuilder<QuizBloc, QuizState>(
            builder: (context, state) {
              if (state is InProgress || state is QuizInitial) {
                return const LoadingData();
              } else if (state is BeginnerQuizLoaded) {
                return QuizScreenQuestions(
                  topic: widget.topic,
                );
              } else {
                DialogManager.showErrorDialog(
                    ExceptionHelper.getErrorMessage(UnexpectedError()),
                    context, () {
                  context.go('/');
                });
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
