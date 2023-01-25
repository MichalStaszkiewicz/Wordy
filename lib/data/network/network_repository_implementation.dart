import 'package:mysql1/mysql1.dart';
import 'package:wordy/data/dto/word_dto.dart';
import 'package:wordy/data/network/database_connection.dart';

import '../../domain/repositiories/server_database_interface_repository.dart';

class ServerDatabaseOperations implements ServerInterface{
  @override
  Future<List<WordDto>> getWordies(String topic) async {
ServerDatabaseConnection connection = ServerDatabaseConnection();
  var result = await connection.connect();
  
      var queryResult = await result
          .query("SELECT * FROM translations WHERE Topic = ?", [topic]);
  
      List<WordDto> words = [];
      for (int i = 0; i < queryResult.length; i++) {
        words.add(WordDto(
            polish: queryResult.elementAt(i).fields['Polish'],
            english: queryResult.elementAt(i).fields['English'],
            french: queryResult.elementAt(i).fields['French'],
            spanish: queryResult.elementAt(i).fields['Spanish']));
      }
      connection.close();
      return words;
  }



}