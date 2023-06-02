import '../data/network/request/models/update_user_interface_language_request_model.dart';
import '../domain/repositiories/repository.dart';
import 'locator/api_locator.dart';

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
    final userId = await locator.get<Repository>().getUserId();
    final userInterfaceLanguage =
        await locator.get<Repository>().getUserInterfaceLanguage();
    if (userId != null) {
      try {
        if (choosenLanguage.toLowerCase() == userInterfaceLanguage &&
            userInterfaceLanguage == 'polish') {
          String message = await locator
              .get<Repository>()
              .switchInterfaceLangauge(UpdateUserInterfaceLanguageModel(
                  userId: userId, languageName: 'english'));
          if (message == "SUCCESS") {
            locator.get<Repository>().synchronizeUserInterfaceLanguage();
          }
        } else {
          String message = await locator
              .get<Repository>()
              .switchInterfaceLangauge(UpdateUserInterfaceLanguageModel(
                  userId: userId, languageName: 'polish'));
          if (message == "SUCCESS") {
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
