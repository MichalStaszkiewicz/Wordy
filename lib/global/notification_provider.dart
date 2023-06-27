import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wordy/domain/models/achievement.dart';
import 'package:wordy/domain/repositiories/stream_repository.dart';
import 'package:wordy/utility/toast_manager.dart';

import '../Utility/locator/service_locator.dart';
import '../const/enums.dart';
import '../data/network/response/achievement_list_response.dart';

class NotificationProvider with ChangeNotifier {
  late StreamSubscription subscription;
  List<Achievement> achievementNotifications = [];
  Widget? quizAnswerNotification;

  NotificationProvider() {
    subscription = locator<StreamRepository>()
        .notificationController
        .stream
        .listen((event) async {
      if (event.runtimeType == AchievementListResponse) {
        event as AchievementListResponse;

        for (int i = 0; i < event.achievements.length; i++) {
          achievementNotifications.add(event.achievements[i].achievement);
          notifyListeners();
        }
        notifyListeners();
      }
    });
  }
  void showInformationAboutChoosenAnswer(
    QuizAnswerStatus answerStatus,
    String choosenAnswer,
    String correctAnswer,
    BuildContext context,
  ) {
    if (answerStatus == QuizAnswerStatus.success) {
      quizAnswerNotification = ToastManager.success(
        context,
      );
    } else {
      quizAnswerNotification =
          ToastManager.error(context, choosenAnswer, correctAnswer);
    }
    notifyListeners();
  }

  void clearChoosenAnswerNotification() {
    quizAnswerNotification = null;
  }
}
