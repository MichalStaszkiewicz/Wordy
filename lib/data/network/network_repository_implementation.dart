import 'package:dio/dio.dart';
import 'package:wordy/data/dto/word_response.dart';
import 'package:wordy/data/dto/word_list_response.dart';
import 'package:wordy/data/network/remote_source.dart';

import '../../domain/repositiories/server_interface.dart';

class NetworkRepository {
  RemoteSource _remoteSource = RemoteSource();
  Future<List<WordResponse>> getWordiesByTopic(String topic) async {
    List<WordResponse> words = [];
    try {
      Dio dio = Dio(BaseOptions());

      Response response = await dio.get('' + '/words');

      if (response.statusCode == 200) {
        print(response.data);
      } else {
        throw Exception("Error" + response.statusCode.toString());
      }
    } catch (exception) {
      print(exception);
    }
    return words;
  }

  Future<WordListResponse> getAllWordies() async {
    List<WordResponse> words = [];

    return await _remoteSource.getAllWords();
  }
/*
  @override
  Future<int> getWordiesCountByTopic(String topic) async {
    ApiService connection = ApiService();
    var result = await connection.connect();

    var queryResult = await result
        .query("SELECT COUNT(id) FROM translations WHERE Topic = ?", [topic]);

    var count = queryResult.first["COUNT(id)"];

    if (count == null) {
      return 0;
    }
    return count;
  }
  */
}
