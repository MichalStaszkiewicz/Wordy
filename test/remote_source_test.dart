import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wordy/data/network/api_service.dart';
import 'package:wordy/data/network/remote_source.dart';

import 'remote_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<RemoteSource>(), MockSpec<ApiService>()])
void main() {
  late MockRemoteSource remoteSource;
  late MockApiService apiService;
  setUpAll(() {
    remoteSource = MockRemoteSource();

    apiService = MockApiService();
  });
  group(RemoteSource, () {
    const topic = 'topic';
    const token = 'token';
    test('getLearnedWordsByTopic', () async {
      when(apiService.get('/v1/knownWords/get/by/topic/$topic',
              options: Options(headers: {'authorization': token})))
          .thenAnswer((invocation) async => Response(
                  statusCode: 200,
                  requestOptions:
                      RequestOptions(path: '', headers: {'token': token}),
                  data: {
                    'words': ['word1', 'word2'],
                  }));

      Response data = await apiService.get('/v1/knownWords/get/by/topic/$topic',
          options: Options(headers: {'authorization': token}));

      expect(data.statusCode, 200);
      expect(data.headers['token'], 'token');
      expect(data.data['words'], ['word1', 'word2']);
    });
  });
}
