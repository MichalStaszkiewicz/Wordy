import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wordy/const/shared_preferences_keys.dart';
import 'package:wordy/data/network/exceptions/validation_error.dart';
import 'package:wordy/data/network/request/login_user_request.dart';
import 'package:wordy/data/network/request/models/login_user_request_model.dart';
import 'package:wordy/data/network/response/login_user_response.dart';
import 'package:wordy/domain/logic/user_service.dart';

import 'package:wordy/domain/repositiories/repository.dart';
import 'package:wordy/global/global_data_manager.dart';
import 'package:wordy/utility/either.dart';
import 'package:wordy/utility/locator/service_locator.dart';
import 'package:wordy/utility/validator.dart';
import 'login_test.mocks.dart';

@GenerateMocks([RepositoryMock, MockUserService])
void main() {
  late RepositoryMock repositoryMock;
  setUp(() => {repositoryMock = RepositoryMock()});
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
  group('loginUser', () {
    test('Should return a valid accessToken and refreshToken', () async {
      final loginUserRequest = LoginUserRequest(
        email: 'asd@wp.pl',
        password: '1234123',
      );
      Map<String, dynamic> userAuthData = {
        "email": "asd@wp.pl",
        "password": '1234123'
      };
      const accessToken = '1234';
      const refreshToken = '4321';
      Either<ValidationError, bool> validate =
          Validator.validateLoginData(userAuthData);
      expect(validate.data, true);
      when(repositoryMock.loginUser(loginUserRequest))
          .thenAnswer((_) async => Either.data(LoginUserResponse(
                message: 'message',
                accessToken: accessToken,
                refreshToken: refreshToken,
              )));

      final loginResponse = await repositoryMock.loginUser(loginUserRequest);
      if (loginResponse!.isData) {
        final tokenAccess = loginResponse!.data!.accessToken;
        final tokenRefresh = loginResponse!.data!.refreshToken;

        repositoryMock.saveTokenAccess(tokenAccess);

        repositoryMock.saveTokenRefresh(tokenRefresh);

        verify(repositoryMock.saveTokenAccess(tokenAccess));
        verify(repositoryMock.saveTokenRefresh(tokenRefresh));
      }
      await repositoryMock.synchronizeUserInterfaceLanguage();
      verify(repositoryMock.synchronizeUserInterfaceLanguage());
      when(repositoryMock.getUserInterfaceLanguage())
          .thenAnswer(((realInvocation) => Either.data('English')));

      final userInterfaceLanguage = repositoryMock.getUserInterfaceLanguage();

      verify(repositoryMock.getUserInterfaceLanguage());

      if (userInterfaceLanguage!.isData) {
        expect('English', userInterfaceLanguage.data);
      } else {
        fail('getUserInterfaceLanguage should return data');
      }
      expect(loginResponse!.isError, false);

      expect(loginResponse.data!.accessToken, accessToken);
      expect(loginResponse.data!.refreshToken, refreshToken);
    });
  });
}
