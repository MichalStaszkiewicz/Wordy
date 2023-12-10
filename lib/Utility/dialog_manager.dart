import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:go_router/go_router.dart';

import '../const/consts.dart';
import '../domain/models/course.dart';
import '../domain/models/custom_error.dart';
import '../global/global_data_manager.dart';
import '../presentation/widgets/custom_dialog_button.dart';
import '../presentation/widgets/select_course_dialog.dart';
import 'locator/service_locator.dart';

class DialogManager {
  DialogManager();
  bool dialogOpened = false;

  Dialog editProfileDialog(
    BuildContext context,
  ) {
    return Dialog(
      child: SizedBox(
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
                  image: const DecorationImage(
                      image: NetworkImage(
                          'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/cb6d15ee-9f60-434a-9a5d-d91026e33e0a/d7til5w-2f3260a3-7092-47b4-aad3-d921b361cc4b.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2NiNmQxNWVlLTlmNjAtNDM0YS05YTVkLWQ5MTAyNmUzM2UwYVwvZDd0aWw1dy0yZjMyNjBhMy03MDkyLTQ3YjQtYWFkMy1kOTIxYjM2MWNjNGIuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.pD52YTUbCEL4DLf6lnWcLUJFI9gpFglFsfO5xLAMErQ')),
                  borderRadius: BorderRadius.circular(50)),
            ),
            const SizedBox(
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
                    colors: const [Colors.redAccent, Colors.redAccent],
                  ),
                  CustomDialogButton(
                    label: 'Apply',
                    colors: const [Colors.blueAccent, Colors.blueAccent],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void showSelectNewCourseDialog(BuildContext context, List<Course> courses) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SelectCourseDialog(
          availableCourses: courses,
        );
      },
    );
  }

  void showSuccessDialog(
      String message, String title, BuildContext context, Function onOkPress) {
    if (dialogOpened) {
      context.pop();
    }
    dialogOpened = true;
    AwesomeDialog(
        context: context,
        title: title,
        desc: message,
        dialogType: DialogType.success,
        btnOkOnPress: () {
          onOkPress();
          dialogOpened = false;
        }).show();
  }

  void showInformationDialog(
      String message, String title, BuildContext context) {
    AwesomeDialog(
            context: context,
            title: title,
            desc: message,
            dialogType: DialogType.info,
            dismissOnTouchOutside: true)
        .show();
  }

  static void showLoadingDialog(
    String title,
    BuildContext context,
  ) {
    AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      dialogType: DialogType.noHeader,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              title,
              style: const TextStyle(fontSize: 16),
            ),
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
          ],
        ),
      ),
      dismissOnBackKeyPress: false,
      dismissOnTouchOutside: false,
    ).show();
  }

  void showLoadingDialogWithCancelButton(
      String message, String title, BuildContext context, Function onCancel) {
    dialogOpened = true;
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
              textAlign: TextAlign.center,
              message,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      btnCancelOnPress: () {
        onCancel;
        dialogOpened = false;
      },
      btnCancelText: translate[locator<GlobalDataManager>().interfaceLanguage]![
          'btn_cancel'],
      dismissOnBackKeyPress: false,
      dismissOnTouchOutside: false,
    ).show();
  }

  void showQuestionDialog(
    String message,
    String title,
    BuildContext context,
    VoidCallback onOkPress,
    VoidCallback onCancelPress,
  ) {
    AwesomeDialog(
            btnCancelText: translate[
                locator<GlobalDataManager>().interfaceLanguage]!['btn_cancel'],
            btnOkText: translate[
                locator<GlobalDataManager>().interfaceLanguage]!['btn_ok'],
            context: context,
            title: title,
            desc: message,
            dialogType: DialogType.question,
            btnCancelOnPress: onCancelPress,
            dismissOnTouchOutside: false,
            btnOkOnPress: onOkPress)
        .show();
  }

  void showErrorDialog(
      CustomError error, BuildContext context, VoidCallback onOkPress) {
    if (dialogOpened) {
      dialogOpened = false;
      context.pop();
    }
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
