import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/data/local/local_storage.dart';
import 'package:wordy/data/network/api_service.dart';
import 'package:wordy/data/network/exceptions/validation_error.dart';
import 'package:wordy/data/network/remote_source.dart';

import 'package:wordy/domain/logic/user_service.dart';
import 'package:wordy/domain/repositiories/repository.dart';
import 'package:wordy/utility/data_validator.dart';
import 'package:wordy/utility/either.dart';

void main() async {
  group('register test', () {
    test(
      'test should check if user password is too short , if so throw an error',
      () {
        Either<Exception, String> result = DataValidator.registerValidate(
            {'email': "asdasd@wp.pl", 'password': '123'}, true);
        expect(result.isError, true);
        if (result.isError) {
          ValidationError exception = result.error as ValidationError;
          expect(
              ValidationError(
                      translate['english']!['error_messages']['validation']
                          ['error'],
                      message: translate['english']!['error_messages']
                          ['validation']['short_password'])
                  .message,
              exception.message);
        }
      },
    );
    test(
      'test should check if user email or password is empty or null, if so throw an error',
      () async {
        Either<Exception, String> result = DataValidator.registerValidate(
            {'email': '', 'password': '123'}, true);
        expect(result.isError, true);
        if (result.isError) {
          ValidationError exception = result.error as ValidationError;
          expect(
              ValidationError(
                      translate['english']!['error_messages']['validation']
                          ['error'],
                      message: translate['english']!['error_messages']
                          ['validation']['fill_fields'])
                  .message,
              exception.message);
        }
      },
    );
    
    test(
      'test should check if user email has invalid format, if so throw an error',
      () async {
        Either<Exception, String> result = DataValidator.registerValidate(
            {'email': 'invalid@email', 'password': '123'}, true);
        expect(result.isError, true);
        if (result.isError) {
          ValidationError exception = result.error as ValidationError;
          expect(exception.message, 'Invalid email format');
        }
      },
    );
    test(
      'test should check if valid user registration succeeds',
      () async {
        Either<Exception, String> result = DataValidator.registerValidate(
            {'email': 'valid@email.com', 'password': 'password123'}, true);
        expect(result.isData, true);
        if (result.isData) {
          expect(result.data, 'success');
        }
      },
    );
  });
}
