import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';

import '../domain/models/course.dart';
import '../domain/models/custom_error.dart';
import '../presentation/widgets/custom_dialog_button.dart';
import '../presentation/widgets/select_course_dialog.dart';

class DialogManager {
  static Dialog editProfileDialog(
    BuildContext context,
  ) {
    return Dialog(
      child: Container(
        height: 300,
        width: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Edit Profile',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/cb6d15ee-9f60-434a-9a5d-d91026e33e0a/d7til5w-2f3260a3-7092-47b4-aad3-d921b361cc4b.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2NiNmQxNWVlLTlmNjAtNDM0YS05YTVkLWQ5MTAyNmUzM2UwYVwvZDd0aWw1dy0yZjMyNjBhMy03MDkyLTQ3YjQtYWFkMy1kOTIxYjM2MWNjNGIuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.pD52YTUbCEL4DLf6lnWcLUJFI9gpFglFsfO5xLAMErQ')),
                  borderRadius: BorderRadius.circular(50)),
            ),
            Container(
                width: 200,
                height: 80,
                child: TextField(
                  decoration: InputDecoration(
                      label: Text("full name"),
                      border: OutlineInputBorder(borderSide: BorderSide())),
                )),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomDialogButton(
                    label: 'Cancel',
                    colors: [Colors.redAccent, Colors.redAccent],
                  ),
                  CustomDialogButton(
                    label: 'Apply',
                    colors: [Colors.blueAccent, Colors.blueAccent],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

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
          mainAxisAlignment: MainAxisAlignment.center,
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
