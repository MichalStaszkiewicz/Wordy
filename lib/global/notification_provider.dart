import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/const/app_router.dart';
import 'package:wordy/data/network/exceptions/exception_helper.dart';
import 'package:wordy/data/network/exceptions/unexpected_error.dart';
import 'package:wordy/domain/logic/user_service.dart';
import 'package:wordy/domain/models/achievement.dart';
import 'package:wordy/domain/repositiories/stream_repository.dart';
import 'package:wordy/utility/dialog_manager.dart';
import 'package:wordy/utility/toast_manager.dart';

import '../Utility/locator/service_locator.dart';
import '../Utility/socket_manager.dart';
import '../const/enums.dart';
import '../data/network/response/achievement_list_response.dart';
import '../presentation/home_page.dart';

class NotificationProvider with ChangeNotifier {
  late StreamSubscription subscription;
  List<Achievement> achievementNotifications = [];
  Widget? quizAnswerNotification;

  NotificationProvider() {
    subscription = locator<StreamRepository>()
        .notificationController
        .stream
        .listen((event) async {
      print("EVEN HAS BEEN FIRED! " + event.runtimeType.toString());
      if (event.runtimeType == AchievementListResponse) {
        event as AchievementListResponse;

        for (int i = 0; i < event.achievements.length; i++) {
          print("ADDING NOTIFICATION ABOUT ACHIEVEMENT");

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
