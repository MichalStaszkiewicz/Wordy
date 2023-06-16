import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/const/app_router.dart';
import 'package:wordy/data/network/exceptions/exception_helper.dart';
import 'package:wordy/data/network/exceptions/unexpected_error.dart';
import 'package:wordy/domain/logic/user_service.dart';
import 'package:wordy/utility/dialog_manager.dart';
import 'package:wordy/utility/locator/service_locator.dart';

class Utility {
  static Future<bool?> selectedCourseTheSameAsNativeLanguage(
      String courseName, BuildContext context) async {
    var userInterfaceLanguage =
        await locator<UserService>().getUserInterfaceLanguage();
    if (userInterfaceLanguage.isError && context.mounted) {
      DialogManager.showErrorDialog(
          ExceptionHelper.getErrorMessage(UnexpectedError()), context, () {
        context.go(AppRouter.authScreen);
      });
      return null;
    } else {
      if (courseName.toLowerCase() ==
          userInterfaceLanguage.data!.toLowerCase()) {
        return true;
      }
      return false;
    }
  }
}
