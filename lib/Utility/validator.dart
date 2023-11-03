import 'package:wordy/const/consts.dart';
import 'package:wordy/domain/logic/user_service.dart';
import 'package:wordy/global/global_data_manager.dart';

import '../domain/repositiories/repository.dart';
import 'locator/service_locator.dart';

class Validator {
  static String? fullNameValidate(String? value) {
    var language = locator<GlobalDataManager>().interfaceLanguage;
    if (value != "" && value != null) {
      return null;
    } else {
      return translate[language]!['error_messages']['required_field'];
    }
  }

  static String? passwordValidate(String? value) {
    var language = locator<GlobalDataManager>().interfaceLanguage;
    if (value == null && value == "") {
      return translate[language]!['error_messages']['required_field'];
    } else if (value!.length < 5) {
      return translate[language]!['error_messages']['short_passwords'];
    }
    return null;
  }

  static String? emailValidate(String? value) {
    var language = locator<GlobalDataManager>().interfaceLanguage;
    if (value == null || value.isEmpty) {
      return translate[language]!['error_messages']['required_field'];
    }
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return translate[language]!['error_messages']['bad_email_format'];
    }
    return null;
  }

  static Future<String> interfaceLanguageChange(String choosenLanguage) async {
    final token = await locator.get<Repository>().getTokenAccess();
    var userInterfaceLanguage =
        locator.get<Repository>().getUserInterfaceLanguage();
    if (token.isData && userInterfaceLanguage.isData) {
      try {
        if (choosenLanguage.toLowerCase() ==
                userInterfaceLanguage.data!.toLowerCase() &&
            userInterfaceLanguage.data!.toLowerCase() == 'polish') {
          var message = await locator
              .get<UserService>()
              .switchInterfaceLangauge('english');

          if (message.isData) {
            locator.get<Repository>().synchronizeUserInterfaceLanguage();
          }
        } else {
          var message = await locator
              .get<UserService>()
              .switchInterfaceLangauge('polish');
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
