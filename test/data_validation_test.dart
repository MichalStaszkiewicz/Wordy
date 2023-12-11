import 'package:flutter_test/flutter_test.dart';
import 'package:wordy/data/network/exceptions/validation_error.dart';
import 'package:wordy/global/global_data_manager.dart';
import 'package:wordy/utility/either.dart';
import 'package:wordy/utility/locator/service_locator.dart';
import 'package:wordy/utility/validator.dart';

void main() {
  setUpAll(() async => {
        await serviceLocator('', '', true),
        locator<GlobalDataManager>().interfaceLanguage = 'english'
      });
  group('Data validation', () {
    test('validate login data with invalid email format', () {
      Map<String, dynamic> userAuthData = {
        "email": "asdf@example",
        "password": '12345'
      };
      Either<ValidationError, bool> validate =
          Validator.validateLoginData(userAuthData);
      expect(validate.error!.type, ValidationErrorType.bad_email_format);
    });

    test('validate login data with empty password', () {
      Map<String, dynamic> userAuthData = {
        "email": "asdf@example.pl",
        "password": ''
      };
      Either<ValidationError, bool> validate =
          Validator.validateLoginData(userAuthData);
      expect(validate.error!.type, ValidationErrorType.fill_fields);
    });

    test('validate login data with empty email', () {
      Map<String, dynamic> userAuthData = {"email": "", "password": '12345'};
      Either<ValidationError, bool> validate =
          Validator.validateLoginData(userAuthData);
      expect(validate.error!.type, ValidationErrorType.fill_fields);
    });

    test('validate login data with both fields empty', () {
      Map<String, dynamic> userAuthData = {"email": "", "password": ''};
      Either<ValidationError, bool> validate =
          Validator.validateLoginData(userAuthData);
      expect(validate.error!.type, ValidationErrorType.fill_fields);
    });
  });
}
