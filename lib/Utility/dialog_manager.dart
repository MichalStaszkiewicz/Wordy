import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';

import '../domain/models/custom_error.dart';

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

  static void showInformationDialog(
      String message, String title, BuildContext context) {
    AwesomeDialog(
            context: context,
            title: title,
            desc: message,
            dialogType: DialogType.info,
            dismissOnTouchOutside: true)
        .show();
  }

  static void showLoadingDialogWithCancelButton(String message, String title,
      BuildContext context, VoidCallBack onCancel) {
    AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      dialogType: DialogType.noHeader,
      body: Center(
        child: Column(
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text(
              message,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      btnCancelOnPress: onCancel,
      btnCancelText: 'Cancel',
      dismissOnBackKeyPress: false,
      dismissOnTouchOutside: false,
    ).show();
  }

  static void showQuestionDialog(
    String message,
    String title,
    BuildContext context,
    VoidCallback onOkPress,
    VoidCallback onCancelPress,
  ) {
    AwesomeDialog(
            context: context,
            title: title,
            desc: message,
            dialogType: DialogType.question,
            btnCancelOnPress: onCancelPress,
            dismissOnTouchOutside: false,
            btnOkOnPress: onOkPress)
        .show();
  }

  static void showErrorDialog(
      CustomError error, BuildContext context, VoidCallback onOkPress) {
    AwesomeDialog(
            context: context,
            title: error.title,
            desc: error.message,
            dismissOnTouchOutside: false,
            dialogType: DialogType.error,
            btnOkOnPress: onOkPress)
        .show();
  }
}
