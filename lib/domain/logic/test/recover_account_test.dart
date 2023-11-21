import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/data/network/exceptions/validation_error.dart';
import 'package:wordy/domain/logic/user_service.dart';
import 'package:wordy/global/global_data_manager.dart';
import 'package:wordy/utility/either.dart';

void main() {
  group('recover account test', () {
    MockUserService userService = MockUserService();
    test(
        'test should check if user email is empty or null, if so throw an error',
        () async {
      Either<Exception, String> result = await userService.recoverAccount('');
      expect(result.isError, true);
      if (result.isError) {
        ValidationError exception = result.error as ValidationError;
        expect(
            exception.message,
            translate['english']!['error_messages']['validation']
                ['fill_fields']);
      }
    });
    test(
        'test should check if user email is in invalid format, if so throw an error',
        () async {
      Either<Exception, String> result =
          await userService.recoverAccount('asd');
      expect(result.isError, true);
      if (result.isError) {
        ValidationError exception = result.error as ValidationError;
        expect(
            exception.message,
            translate['english']!['error_messages']['validation']
                ['bad_email_format']);
      }
    });
  });
}
