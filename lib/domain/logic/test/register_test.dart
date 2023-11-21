import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wordy/data/network/exceptions/validation_error.dart';

import 'package:wordy/domain/logic/user_service.dart';
import 'package:wordy/utility/either.dart';

void main() {
  group('register test', () {
    MockUserService userService = MockUserService();
    test(
      'test should check if user password is too short , if so throw an error',
      () async {
        Either<Exception, String> result = await userService
            .registerUser({'email': "asdasd@wp.pl", 'password': '123'});
        expect(result.isError, true);
        if (result.isError) {
          ValidationError exception = result.error as ValidationError;
          expect(exception.message, 'Password is too short');
        }
      },
    );
    test(
      'test should check if user email is empty or null, if so throw an error',
      () async {
        Either<Exception, String> result =
            await userService.registerUser({'email': '', 'password': '123'});
        expect(result.isError, true);
        if (result.isError) {
          ValidationError exception = result.error as ValidationError;
          expect(exception.message, 'email empty or null');
        }
      },
    );
    test(
      'test should check if user password is empty or null, if so throw an error',
      () async {
        Either<Exception, String> result = await userService
            .registerUser({'email': 'asdasd@wp.pl', 'password': ''});
        expect(result.isError, true);
        if (result.isError) {
          ValidationError exception = result.error as ValidationError;
          expect(exception.message, 'password empty or null');
        }
      },
    );
    test(
      'test should check if user email has invalid format, if so throw an error',
      () async {
        Either<Exception, String> result = await userService
            .registerUser({'email': 'invalid@email', 'password': '123'});
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
        Either<Exception, String> result = await userService.registerUser(
            {'email': 'valid@email.com', 'password': 'password123'});
        expect(result.isData, true);
        if (result.isData) {
          expect(result.data, 'data');
        }
      },
    );
  });
}
