import 'dart:math';

import 'package:sqflite/sqflite.dart';
import 'package:wordy/Utility/utility.dart';
import 'package:wordy/data/dto/word_dto.dart';
import 'package:wordy/data/local/local_database.dart';
import 'package:wordy/domain/models/quiz_question.dart';
import 'package:wordy/domain/repositiories/local_database_interface_repository.dart';

import '../dto/quiz_question_dto.dart';

class LocalRepository implements LocalInterface {
  @override
  Future<List<WordDto>> getUserLearnedWordies() async {
    Utility utility = Utility();
    LocalDatabase localdb = LocalDatabase();
    Database db = await localdb.connect();
    List<WordDto> words = [];

    var profile = await db.rawQuery("SELECT currentCourse FROM profile");
    if (profile.isNotEmpty) {
   


      Map<String, String> map = await localdb.getCurrentCourseInformation();

      var learnedWords =
          await db.rawQuery("SELECT * FROM ${map['courseNameTable']}");
      for (int i = 0; i < learnedWords.length; i++) {
        words.add(WordDto(
            polish: learnedWords[i]['Polish'].toString(),
            english: learnedWords[i]['English'].toString(),
            french: learnedWords[i]['French'].toString(),
            spanish: learnedWords[i]['Spanish'].toString()));
      }
    }
    return words;
  }
}
