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
import '../global/notification_provider.dart';
import '../presentation/Bloc/quiz/quiz_bloc.dart';

class Utility {
  static Future<bool?> selectedCourseTheSameAsNativeLanguage(
      String courseName, BuildContext context) async {
    var userInterfaceLanguage =
        await locator<UserService>().getUserInterfaceLanguage();
    if (userInterfaceLanguage.isError && context.mounted) {
      DialogManager.showErrorDialog(
          ExceptionHelper.getErrorMessage(UnexpectedError()), context, () {
        context.go(AppRouter.authScreen);
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
      BeginnerQuizLoaded state,
      NotificationProvider notification,
      String topic) {
    if (state.selectedIndex != null && !state.answerChecked) {
      if (state.selectedIndex ==
          state.questions[state.currentQuestionIndex].correctAnswerIndex) {
        notification.showInformationAboutChoosenAnswer(
            QuizAnswerStatus.success,
            state.questions[state.currentQuestionIndex]
                .answers[state.selectedIndex!],
            state.questions[state.currentQuestionIndex].answers[
                state.questions[state.currentQuestionIndex].correctAnswerIndex],
            context);
        context.read<QuizBloc>().add(CheckAnswer());
      } else {
        notification.showInformationAboutChoosenAnswer(
            QuizAnswerStatus.failure,
            state.questions[state.currentQuestionIndex]
                .answers[state.selectedIndex!],
            state.questions[state.currentQuestionIndex].answers[
                state.questions[state.currentQuestionIndex].correctAnswerIndex],
            context);
        context.read<QuizBloc>().add(CheckAnswer());
      }
    } else if (state.selectedIndex != null && state.answerChecked == true) {
      if (state.currentQuestionIndex == state.questions.length - 1 &&
          state.selectedIndex ==
              state.questions[state.currentQuestionIndex].correctAnswerIndex) {
        context.go(AppRouter.quizCompleted, extra: {
          'topic': topic,
          'maximumPoints': state.questions,
          'correctAnswers': state.correctAnswersWordIndexes,
        });

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
      await Future.delayed(
          Duration(seconds: 3)); // Opóźnienie 3 sekundy między notyfikacjami
      if (context.mounted) {
        ToastManager.achievementNotification(context, notifications[i]);
      }
    }
  }
}
