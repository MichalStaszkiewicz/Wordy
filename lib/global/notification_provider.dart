import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordy/domain/models/achievement.dart';
import 'package:wordy/domain/repositiories/stream_repository.dart';
import 'package:wordy/utility/toast_manager.dart';

import '../Utility/locator/service_locator.dart';
import '../data/network/response/achievement_list_response.dart';
import '../presentation/home_page.dart';

class NotificationProvider with ChangeNotifier {
  BuildContext? context;
  late StreamSubscription subscription;

  NotificationProvider() {
    subscription = locator<StreamRepository>()
        .achievemnetNotificationController
        .stream
        .listen((event) async {
      for (int i = 0; i < event.achievements.length; i++) {
        if (context != null) {
          if (context!.mounted) {
            achievementsNotification(
                event.achievements.elementAt(i).achievement);
          }
        }

        await Future.delayed(Duration(seconds: 3));
      }

      subscription.cancel();
    });
  }

  void achievementsNotification(Achievement achievement) {
    if (context != null) {
      ToastManager.achievementNotification(context!, achievement);
      notifyListeners();
    }
  }
}
