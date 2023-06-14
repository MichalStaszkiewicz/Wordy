import 'package:achievement_view/achievement_view.dart';
import 'package:flutter/material.dart';

import '../domain/models/achievement.dart';

class ToastManager {
  static void achievementNotification(
      BuildContext context, Achievement achievement) {
    AchievementView(
      title: achievement.name,
      subTitle: achievement.description,
      isCircle: false,
      listener: print,
    ).show(context);
  }
}
