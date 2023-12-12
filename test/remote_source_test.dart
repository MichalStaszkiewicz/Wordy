import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wordy/data/network/api_service.dart';
import 'package:wordy/data/network/exceptions/bad_network_exception.dart';
import 'package:wordy/data/network/remote_source.dart';
import 'package:wordy/data/network/request/login_user_request.dart';
import 'package:wordy/data/network/request/register_user_request.dart';
import 'package:wordy/data/network/response/known_word_list.dart';
import 'package:wordy/utility/either.dart';

import 'remote_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<RemoteSource>(), MockSpec<ApiService>()])
void main() {
  late final ApiService apiService;
  setUpAll(() => {apiService = MockApiService()});

  group(RemoteSource, () {
    const topic = 'topic';
    const token = 'token';

    group('getLearnedWordsByTopic', () {
      String endpoint = '/v1/knownWords/get/by/topic/$topic';

      test('throws DioException when network request for learned words fails',
          () async {
        final MockApiService apiService = MockApiService();
        when(apiService.get(endpoint))
            .thenThrow(DioException(requestOptions: RequestOptions()));

        expect(() => apiService.get(endpoint),
            throwsA(const TypeMatcher<DioException>()));
      });

      test(
          'returns a successful response with learned words when network request is successful',
          () async {
        final MockApiService apiService = MockApiService();
        when(apiService.get(endpoint))
            .thenAnswer((invocation) async => Response(
                  statusCode: 200,
                  requestOptions:
                      RequestOptions(path: '', headers: {'token': token}),
                  data: {
                    'words': ['word1', 'word2']
                  },
                ));
        Response data = await apiService.get(endpoint);

        expect(data.statusCode, 200);
        expect(data.requestOptions.headers['token'], 'token');
        expect(data.data['words'], ['word1', 'word2']);
      });
    });

    group('getWordsByTopic', () {
      String endpoint = 'v1/words/$topic';

      test('throws DioException when network request for words by topic fails',
          () async {
        final MockApiService apiService = MockApiService();
        when(apiService.get(endpoint))
            .thenThrow(DioException(requestOptions: RequestOptions()));

        expect(() => apiService.get(endpoint),
            throwsA(const TypeMatcher<DioException>()));
      });

      test(
          'returns a successful response with valid topic words when network request is successful',
          () async {
        final MockApiService apiService = MockApiService();
        when(apiService.get(endpoint))
            .thenAnswer((invocation) async => Response(
                  statusCode: 200,
                  requestOptions:
                      RequestOptions(path: '', headers: {'token': token}),
                  data: {
                    'words': ['word1', 'word2']
                  },
                ));
        Response data = await apiService.get(endpoint);

        expect(data.statusCode, 200);
        expect(data.requestOptions.headers['token'], 'token');
        expect(data.data['words'], ['word1', 'word2']);
      });
    });

    group('loginUser', () {
      String endpoint = '/v1/user/login';
      LoginUserRequest request =
          LoginUserRequest(email: 'email', password: 'password');

      test('throws DioException when login network request fails', () async {
        final MockApiService apiService = MockApiService();
        when(apiService.post(endpoint, payload: request.toJson()))
            .thenThrow(DioException(requestOptions: RequestOptions()));

        expect(() => apiService.post(endpoint, payload: request.toJson()),
            throwsA(const TypeMatcher<DioException>()));
      });

      test(
          'returns a successful response with valid login when network request is successful',
          () async {
        when(apiService.post(endpoint, payload: request.toJson()))
            .thenAnswer((invocation) async => Response(
                  statusCode: 200,
                  requestOptions:
                      RequestOptions(path: '', headers: {'token': token}),
                  data: {'tokenAccess': 'tokenAccess'},
                ));
        Response data =
            await apiService.post(endpoint, payload: request.toJson());

        expect(data.statusCode, 200);
        expect(data.requestOptions.headers['token'], 'token');
        expect(data.data['tokenAccess'], 'tokenAccess');
      });
    });

    group('registerUser', () {
      String endpoint = '/v1/user/register';
      RegisterUserRequest request = RegisterUserRequest(
          email: 'email', password: 'password', fullName: 'fullName');

      test('throws DioException when register user network request fails',
          () async {
        final MockApiService apiService = MockApiService();
        when(apiService.post(endpoint, payload: request.toJson()))
            .thenThrow(DioException(requestOptions: RequestOptions()));

        expect(() => apiService.post(endpoint, payload: request.toJson()),
            throwsA(const TypeMatcher<DioException>()));
      });

      test(
          'returns a successful response with valid registration when network request is successful',
          () async {
        when(apiService.post(endpoint, payload: request.toJson()))
            .thenAnswer((invocation) async => Response(
                  statusCode: 200,
                  requestOptions:
                      RequestOptions(path: '', headers: {'token': token}),
                  data: {'tokenAccess': 'tokenAccess'},
                ));
        Response data =
            await apiService.post(endpoint, payload: request.toJson());

        expect(data.statusCode, 200);
        expect(data.requestOptions.headers['token'], 'token');
        expect(data.data['tokenAccess'], 'tokenAccess');
      });
    });

    group('getRegisterationStatus', () {
      String endpoint = '/v1/user/info/registerStatus';

      test(
          'throws DioException when get registration status network request fails',
          () async {
        final MockApiService apiService = MockApiService();
        when(apiService.get(endpoint))
            .thenThrow(DioException(requestOptions: RequestOptions()));

        expect(
            () => apiService.get(
                  endpoint,
                ),
            throwsA(const TypeMatcher<DioException>()));
      });

      test(
          'returns a successful response with valid registration status when network request is successful',
          () async {
        when(apiService.get(
          endpoint,
        )).thenAnswer((invocation) async => Response(
              statusCode: 200,
              requestOptions:
                  RequestOptions(path: '', headers: {'token': token}),
              data: {'registerationCompleted': 'true'},
            ));
        Response data = await apiService.get(
          endpoint,
        );

        expect(data.statusCode, 200);
        expect(data.requestOptions.headers['token'], 'token');
        expect(data.data['registerationCompleted'], 'true');
      });
    });

    group('getAvailableLanguages', () {
      String endpoint = '/v1/languages';

      test(
          'throws DioException when get available languages network request fails',
          () async {
        final MockApiService apiService = MockApiService();
        when(apiService.get(
          endpoint,
        )).thenThrow(DioException(requestOptions: RequestOptions()));

        expect(
            () => apiService.post(
                  endpoint,
                ),
            throwsA(const TypeMatcher<DioException>()));
      });

      test(
          'returns a successful response with available languages when network request is successful',
          () async {
        when(apiService.post(
          endpoint,
        )).thenAnswer((invocation) async => Response(
              statusCode: 200,
              requestOptions:
                  RequestOptions(path: '', headers: {'token': token}),
              data: {'languages': []},
            ));
        Response data = await apiService.post(
          endpoint,
        );

        expect(data.statusCode, 200);
        expect(data.requestOptions.headers['token'], 'token');
        expect(data.data['languages'], []);
      });
    });

    group('switchInterfaceLanguage', () {
      String endpoint = '/v1/user/update/language';
      String languageName = 'english';

      test(
          'throws DioException when switch interface language network request fails',
          () async {
        final MockApiService apiService = MockApiService();
        when(apiService.put(endpoint, payload: {"languageName": languageName}))
            .thenThrow(DioException(requestOptions: RequestOptions()));

        expect(
            () => apiService
                .post(endpoint, payload: {"languageName": languageName}),
            throwsA(const TypeMatcher<DioException>()));
      });

      test(
          'returns a successful response when switching interface language is successful',
          () async {
        when(apiService.post(
          endpoint,
        )).thenAnswer((invocation) async => Response(
              statusCode: 200,
              requestOptions:
                  RequestOptions(path: '', headers: {'token': token}),
              data: {'status': 200},
            ));
        Response data = await apiService.post(
          endpoint,
        );

        expect(data.statusCode, 200);
        expect(data.requestOptions.headers['token'], 'token');
        expect(data.data['status'], 200);
      });
    });

    group('updateRegisterationStatus', () {
      // String endpoint = '/v1/user/update/registerStatus';
      // String languageName = 'english';

      // test('throws DioException when update registration status network request fails', () async {
      //   final MockApiService apiService = MockApiService();
      //   when(apiService.put(endpoint,
      //           options: Options(headers: {'authorization': token})))
      //       .thenThrow(DioException(requestOptions: RequestOptions()));

      //   expect(
      //       () => apiService.put(endpoint,
      //           options: Options(headers: {'authorization': token})),
      //       throwsA(const TypeMatcher<DioException>()));
      // });

      // test('returns a successful response with valid registration status when network request is successful', () async {
      //   when(apiService.put(endpoint,
      //           options: Options(headers: {'authorization': token})))
      //       .thenAnswer((invocation) async => Response(
      //             statusCode: 200,
      //             requestOptions:
      //                 RequestOptions(path: '', headers: {'token': token}),
      //             data: {'status': 200},
      //           ));
      //   Response data = await apiService.put(endpoint,
      //       options: Options(headers: {'authorization': token}));

      //   expect(data.statusCode, 200);
      //   expect(data.requestOptions.headers['token'], 'token');
      //   expect(data.data['status'], 200);
      // });
    });
  });
}
