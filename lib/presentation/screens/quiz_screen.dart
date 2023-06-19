import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wordy/domain/repositiories/stream_repository.dart';

import 'package:wordy/presentation/widgets/loading_data.dart';

import 'package:wordy/presentation/screens/quiz_screen_questions.dart';

import '../../Utility/dialog_manager.dart';
import '../../Utility/locator/service_locator.dart';
import '../../const/app_router.dart';
import '../../data/network/exceptions/exception_helper.dart';
import '../../data/network/exceptions/unexpected_error.dart';
import '../../global/notification_provider.dart';
import '../Bloc/quiz/quiz_bloc.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen({super.key, required this.topic});
  String topic;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotificationProvider(),
      builder: (context, child) => BlocProvider(
        create: (context) => QuizBloc(locator<StreamRepository>())
          ..add(LoadBeginnerQuiz(topic: widget.topic)),
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
              },
              child: BlocBuilder<QuizBloc, QuizState>(
                builder: (context, state) {
                  if (state is InProgress || state is QuizInitial) {
                    return const LoadingData();
                  } else if (state is BeginnerQuizLoaded) {
                    return QuizScreenQuestions(
                      topic: widget.topic,
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
