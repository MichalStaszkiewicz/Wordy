import 'package:wordy/const/consts.dart';
import 'package:wordy/data/network/exceptions/validation_error.dart';
import 'package:wordy/domain/logic/user_service.dart';
import 'package:wordy/global/global_data_manager.dart';
import 'package:wordy/utility/either.dart';

import '../domain/repositiories/repository.dart';
import 'locator/service_locator.dart';

class Validator {
  static Either<ValidationError, bool> validateLoginData(
      Map<String, dynamic> userAuthData) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (userAuthData['email'] == null ||
        userAuthData['email'].length == 0 ||
        userAuthData['password'] == null ||
        userAuthData['password'].length == 0) {
      return Either.error(ValidationError(
          message: translate[locator<GlobalDataManager>().interfaceLanguage]![
              'error_messages']['validation']['fill_fields'],
          translate[locator<GlobalDataManager>().interfaceLanguage]![
              'error_messages']['validation']['error'],
          type: ValidationErrorType.fill_fields));
    }

    if (!emailRegExp.hasMatch(userAuthData['email'])) {
      return Either.error(ValidationError(
          message: translate[locator<GlobalDataManager>().interfaceLanguage]![
              'error_messages']['validation']['bad_email_format'],
          translate[locator<GlobalDataManager>().interfaceLanguage]![
              'error_messages']['validation']['error'],
          type: ValidationErrorType.bad_email_format));
    }
    return Either.data(true);
  }

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

  static Either<Exception, String> registerValidate(
      Map<String, dynamic> userAuthData, bool test) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (userAuthData['email'] == null || userAuthData['password'] == null) {
      return Either.error(ValidationError(
          translate['english']!['error_messages']['validation']['error'],
          message: translate['english']!['error_messages']['validation']
              ['fill_fields'],
          type: ValidationErrorType.fill_fields));
    }

    if (!emailRegExp.hasMatch(userAuthData['email'])) {
      return Either.error(ValidationError(
          translate['english']!['error_messages']['validation']['error'],
          message: translate['english']!['error_messages']['validation']
              ['bad_email_format'],
          type: ValidationErrorType.bad_email_format));
    }
    if ((userAuthData['password'] as String).length < 5) {
      return Either.error(ValidationError(
          translate['english']!['error_messages']['validation']['error'],
          message: translate['english']!['error_messages']['validation']
              ['short_password'],
          type: ValidationErrorType.short_password));
    }
    return Either.data('success');
  }

  static Either<Exception, String> recoverAccountValidate(String email) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (email == '') {
      return Either.error(ValidationError(
          translate[locator<GlobalDataManager>().interfaceLanguage]![
              'error_messages']['validation']['error'],
          message: translate[locator<GlobalDataManager>().interfaceLanguage]![
              'error_messages']['validation']['fill_fields'],
          type: ValidationErrorType.fill_fields));
    }

    if (!emailRegExp.hasMatch(email)) {
      return Either.error(ValidationError(
          translate[locator<GlobalDataManager>().interfaceLanguage]![
              'error_messages']['validation']['error'],
          message: translate[locator<GlobalDataManager>().interfaceLanguage]![
              'error_messages']['validation']['bad_email_format'],
          type: ValidationErrorType.bad_email_format));
    }
    return Either.data('success');
  }
}
