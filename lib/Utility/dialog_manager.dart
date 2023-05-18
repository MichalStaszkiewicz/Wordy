import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';

class DialogManager {
  static void showSuccessDialog(String message, String title,
      BuildContext context, VoidCallback onOkPress) {
    AwesomeDialog(
            context: context,
            title: title,
            desc: message,
            dialogType: DialogType.success,
            btnOkOnPress: onOkPress)
        .show();
  }

  static void showLoadingDialog(
      String message, String title, BuildContext context) {
    AwesomeDialog(
            context: context,
            title: title,
            desc: message,
            dialogType: DialogType.info,
            dismissOnTouchOutside: false)
        .show();
  }

  static void showQuestionDialog(
      String message,
      String title,
      BuildContext context,
      VoidCallback onOkPress,
      VoidCallback onCancelPress) {
    AwesomeDialog(
            context: context,
            title: title,
            desc: message,
            dialogType: DialogType.question,
            btnCancelOnPress: onCancelPress,
            btnOkOnPress: onOkPress)
        .show();
  }

  static void showErrorDialog(String message, String title,
      BuildContext context, VoidCallback onOkPress) {
    AwesomeDialog(
            context: context,
            title: title,
            desc: message,
            dialogType: DialogType.error,
            btnOkOnPress: onOkPress)
        .show();
  }
}
