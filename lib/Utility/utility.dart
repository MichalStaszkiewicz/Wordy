import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wordy/const/app_router.dart';
import 'package:wordy/data/network/exceptions/exception_helper.dart';
import 'package:wordy/data/network/exceptions/unexpected_error.dart';
import 'package:wordy/domain/logic/user_service.dart';
import 'package:wordy/utility/dialog_manager.dart';
import 'package:wordy/utility/locator/service_locator.dart';
import 'package:wordy/utility/toast_manager.dart';

import '../const/enums.dart';
import '../domain/models/achievement.dart';

import '../domain/models/vocabulary_question.dart';
import '../global/notification_provider.dart';
import 'package:wordy/presentation/bloc/quiz/quiz_bloc.dart';

class Utility {
  static Future<bool?> selectedCourseTheSameAsNativeLanguage(
      String courseName, BuildContext context) async {
    var userInterfaceLanguage =
        locator<UserService>().getUserInterfaceLanguage();
    if (userInterfaceLanguage.isData && context.mounted) {
      DialogManager.showErrorDialog(
          ExceptionHelper.getErrorMessage(UnexpectedError()), context, () {
        context.go(AppRouter.loginScreen);
      });
      return null;
    } else {
      if (courseName.toLowerCase() ==
          userInterfaceLanguage.data!.toLowerCase()) {
        return true;
      }
      return false;
    }
  }

  static void quizAnswerValidationLogic(
    BuildContext context,
    QuizQuestionsReady state,
    NotificationProvider notification,
    String topic,
  ) {
    int currentQuestionIndex = context.read<QuizBloc>().currentQuestionIndex;
    List<VocabularyQuestion> questions = context.read<QuizBloc>().questions;
    if (state.selectedIndex != null && !state.answerChecked) {
      if (state.selectedIndex ==
          context
              .read<QuizBloc>()
              .questions[currentQuestionIndex]
              .correctAnswerIndex) {
        notification.showInformationAboutChoosenAnswer(
            QuizAnswerStatus.success,
            questions[currentQuestionIndex].answers[state.selectedIndex!],
            questions[currentQuestionIndex]
                .answers[questions[currentQuestionIndex].correctAnswerIndex],
            context);
        context.read<QuizBloc>().add(CheckAnswer(
            questionIndex: currentQuestionIndex,
            selectedIndex: state.selectedIndex!));
        context.read<QuizBloc>().correctAnswersCount.add(1);
      } else {
        notification.showInformationAboutChoosenAnswer(
            QuizAnswerStatus.failure,
            questions[currentQuestionIndex].answers[state.selectedIndex!],
            questions[currentQuestionIndex]
                .answers[questions[currentQuestionIndex].correctAnswerIndex],
            context);
        context.read<QuizBloc>().add(CheckAnswer(
            questionIndex: currentQuestionIndex,
            selectedIndex: state.selectedIndex!));
        context.read<QuizBloc>().incorrectAnsersCount.add(1);
      }
    } else if (state.selectedIndex != null && state.answerChecked == true) {
      if (currentQuestionIndex == questions.length - 1 &&
          state.selectedIndex ==
              questions[currentQuestionIndex].correctAnswerIndex) {
        context.read<QuizBloc>().add(FinishQuiz(
            topic: topic,
            wordIds: List.from(context
                .read<QuizBloc>()
                .questions
                .map((e) => e.wordId)
                .toList())));
        notification.clearChoosenAnswerNotification();
      } else {
        context.read<QuizBloc>().add(LoadNextQuestion());
        notification.clearChoosenAnswerNotification();
      }
    }
  }

  static Future<void> showAchievementNotifications(
      List<Achievement> notifications, BuildContext context) async {
    for (int i = 0; i < notifications.length; i++) {
      await Future.delayed(const Duration(seconds: 3));
      if (context.mounted) {
        ToastManager.achievementNotification(context, notifications[i]);
      }
    }
  }
}
