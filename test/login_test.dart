import 'package:flutter_test/flutter_test.dart';
import 'package:wordy/data/network/exceptions/validation_error.dart';
import 'package:wordy/utility/either.dart';
import 'package:wordy/utility/validator.dart';

void main() {
  group('Data validation', () {
    test('validate login data', () {
      Map<String, dynamic> userAuthData = {
        "email": "asdf@example",
        "password": '12345'
      };
      Either<ValidationError, bool> validate =
          Validator.validateLoginData(userAuthData);
      expect(validate.error, ValidationError);
    });
  });
}
