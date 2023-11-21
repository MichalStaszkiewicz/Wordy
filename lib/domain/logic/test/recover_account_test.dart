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
import 'package:wordy/global/global_data_manager.dart';
import 'package:wordy/utility/data_validator.dart';
import 'package:wordy/utility/either.dart';

void main() async {
  group('recover account test', () {
    test(
        'test should check if user email is empty or null, if so throw an error',
        () async {
      Either<Exception, String> result =
          DataValidator.recoverAccountValidate('', true);
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
          DataValidator.recoverAccountValidate('asd', true);
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
