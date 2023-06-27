import 'package:achievement_view/achievement_view.dart';
import 'package:flutter/material.dart';
import 'package:wordy/presentation/widgets/failure_toast.dart';

import '../domain/models/achievement.dart';
import '../presentation/widgets/success_toast.dart';

class ToastManager {
  static void achievementNotification(
      BuildContext context, Achievement achievement) {
    AchievementView(
      duration: const Duration(milliseconds: 200),
      title: achievement.name,
      subTitle: achievement.description,
      isCircle: false,
      listener: print,
    ).show(context);
  }

  static Widget success(BuildContext context) {
    return SuccessToast(
      deviceDimensions: MediaQuery.of(context).size,
    );
  }

  static Widget error(
      BuildContext context, String choosenAnswer, String correctAnswer) {
    return FailureToast(
      deviceDimensions: MediaQuery.of(context).size, choosenAnswer:choosenAnswer,  correctAnswer:correctAnswer
    );
  }
}
