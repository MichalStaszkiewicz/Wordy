import 'package:wordy/Utility/locator/service_locator.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/data/network/exceptions/validation_error.dart';
import 'package:wordy/global/global_data_manager.dart';
import 'package:wordy/utility/either.dart';

class DataValidator {
  static Either<Exception, String> registerValidate(
      Map<String, dynamic> userAuthData, bool test) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (test) {
      if (userAuthData['email'] == null ||
          userAuthData['email'] == '' ||
          userAuthData['password'] == null ||
          userAuthData['password'] == '') {
        return Either.error(ValidationError(
            translate['english']!['error_messages']['validation']['error'],
            message: translate['english']!['error_messages']['validation']
                ['fill_fields']));
      }

      if (!emailRegExp.hasMatch(userAuthData['email'])) {
        return Either.error(ValidationError(
            translate['english']!['error_messages']['validation']['error'],
            message: translate['english']!['error_messages']['validation']
                ['bad_email_format']));
      }
      if ((userAuthData['password'] as String).length < 5) {
        return Either.error(ValidationError(
            translate['english']!['error_messages']['validation']['error'],
            message: translate['english']!['error_messages']['validation']
                ['short_password']));
      }
      return Either.data('success');
    } else {
      if (userAuthData['email'] == null || userAuthData['password'] == null) {
        return Either.error(ValidationError(
            translate['english']!['error_messages']['validation']['error'],
            message: translate['english']!['error_messages']['validation']
                ['fill_fields']));
      }

      if (!emailRegExp.hasMatch(userAuthData['email'])) {
        return Either.error(ValidationError(
            translate['english']!['error_messages']['validation']['error'],
            message: translate['english']!['error_messages']['validation']
                ['bad_email_format']));
      }
      if ((userAuthData['password'] as String).length < 5) {
        return Either.error(ValidationError(
            translate['english']!['error_messages']['validation']['error'],
            message: translate['english']!['error_messages']['validation']
                ['short_password']));
      }
      return Either.data('success');
    }
  }

  static Either<Exception, String> recoverAccountValidate(
      String email, bool test) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (test) {
      if (email == '') {
        return Either.error(ValidationError(
            translate['english']!['error_messages']['validation']['error'],
            message: translate['english']!['error_messages']['validation']
                ['fill_fields']));
      }

      if (!emailRegExp.hasMatch(email)) {
        return Either.error(ValidationError(
            translate['english']!['error_messages']['validation']['error'],
            message: translate['english']!['error_messages']['validation']
                ['bad_email_format']));
      }
      return Either.data('success');
    } else {
      if (email == '') {
        return Either.error(ValidationError(
            translate[locator<GlobalDataManager>().interfaceLanguage]![
                'error_messages']['validation']['error'],
            message: translate[locator<GlobalDataManager>().interfaceLanguage]![
                'error_messages']['validation']['fill_fields']));
      }

      if (!emailRegExp.hasMatch(email)) {
        return Either.error(ValidationError(
            translate[locator<GlobalDataManager>().interfaceLanguage]![
                'error_messages']['validation']['error'],
            message: translate[locator<GlobalDataManager>().interfaceLanguage]![
                'error_messages']['validation']['bad_email_format']));
      }
      return Either.data('success');
    }
  }
}
