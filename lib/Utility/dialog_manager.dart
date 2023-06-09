import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';

import '../domain/models/course.dart';
import '../domain/models/custom_error.dart';
import '../presentation/widgets/select_course_dialog.dart';

class DialogManager {
  static void showSelectNewCourseDialog(
      BuildContext context, List<Course> courses) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SelectCourseDialog(
          availableCourses: courses,
        );
      },
    );
  }

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
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text(
              message,
              style: const TextStyle(fontSize: 16),
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
