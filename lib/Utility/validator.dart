import 'package:wordy/domain/logic/user_service.dart';

import '../domain/repositiories/repository.dart';
import 'locator/service_locator.dart';

class Validator {
  static String? fullNameValidate(String? value) {
    if (value != "" && value != null) {
      return null;
    } else {
      return "This field is required ";
    }
  }

  static String? passwordValidate(String? value) {
    if (value == null && value == "") {
      return 'This field is required';
    } else if (value!.length < 5) {
      return 'Password must be at least 5 characters long';
    }
    return null;
  }

  static String? emailValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Invalid email format';
    }
    return null;
  }

  static Future<String> interfaceLanguageChange(String choosenLanguage) async {
    final token = await locator.get<Repository>().getTokenAccess();
    var userInterfaceLanguage =
        await locator.get<Repository>().getUserInterfaceLanguage();
    if (token.isData && userInterfaceLanguage.isData) {
      try {
        if (choosenLanguage.toLowerCase() ==
                userInterfaceLanguage.data!.toLowerCase() &&
            userInterfaceLanguage.data!.toLowerCase() == 'polish') {
          var message = await locator
              .get<UserService>()
              .switchInterfaceLangauge(token.data!, 'english');

          if (message.isData) {
            locator.get<Repository>().synchronizeUserInterfaceLanguage();
          }
        } else {
          var message = await locator
              .get<Repository>()
              .switchInterfaceLangauge(token.data!, 'polish');
          if (message.isData) {
            locator.get<Repository>().synchronizeUserInterfaceLanguage();
          }
        }

        return choosenLanguage;
      } on Exception catch (e) {
        throw Exception(e);
      }
    } else {
      return '';
    }
  }
}
