import 'package:sqflite/sqflite.dart';
import 'package:wordy/Utility/utility.dart';

import '../../domain/models/quiz_question.dart';

class LocalDatabase {
  static final LocalDatabase _instance = LocalDatabase._internal();
  late Database _db;

  factory LocalDatabase() {
    return _instance;
  }

  LocalDatabase._internal();

  Future<Database> connect() async {
    String databasePath = await getDatabasesPath();
    String path = "$databasePath/wordyDB.db/";
    _db = await openDatabase(path);

    return _db;
  }

  

  void close() {
    _db.close();
  }
}
