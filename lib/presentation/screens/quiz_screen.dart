import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:wordy/domain/repositiories/stream_repository.dart';
import 'package:wordy/presentation/bloc/quiz/quiz_bloc.dart';

import 'package:wordy/presentation/widgets/loading_data.dart';

import 'package:wordy/presentation/screens/quiz_screen_questions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Utility/dialog_manager.dart';
import '../../Utility/locator/service_locator.dart';
import '../../const/app_router.dart';
import '../../domain/models/topic.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen({
    super.key,
    required this.topic,
  });
  Topic topic;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizBloc(
        locator<StreamRepository>(),
      )..add(LoadQuiz(
          topic: widget.topic.name,
        )),
      child: Scaffold(
        body: Container(
          child: BlocListener<QuizBloc, QuizState>(
            listener: (context, state) {
              if (state is QuizError) {
                DialogManager.showErrorDialog(state.error, context, () {
                  if (state.error.critical) {
                    context.go(AppRouter.authScreen);
                  }
                });
              }
              if (state is QuizCompleted) {
                context.go(AppRouter.quizCompleted, extra: {
                  'topicCompleted': state.topicCompleted,
                  'topic': widget.topic,
                  'learnedWords':
                      context.read<QuizBloc>().learnedWordsIds.length,
                  'score':
                      (context.read<QuizBloc>().correctAnswersCount.length /
                                  (context
                                          .read<QuizBloc>()
                                          .correctAnswersCount
                                          .length +
                                      context
                                          .read<QuizBloc>()
                                          .incorrectAnsersCount
                                          .length))
                              .toDouble() *
                          100,
                });
              }
            },
            child: BlocBuilder<QuizBloc, QuizState>(
              builder: (context, state) {
                if (state is InProgress || state is QuizInitial) {
                  return const LoadingData();
                } else if (state is QuizQuestionsReady) {
         
                  return QuizScreenQuestions(
                    topic: widget.topic.name, 
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
