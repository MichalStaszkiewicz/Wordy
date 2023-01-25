import 'package:sqflite/sqflite.dart';
import 'package:wordy/Utility/utility.dart';
import 'package:wordy/data/dto/course_dto.dart';
import 'package:wordy/data/local/local_database.dart';

import 'package:wordy/domain/repositiories/local_database_interface_repository.dart';

class LocalRepository implements LocalInterface {


  @override
  void createDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = "$databasePath/wordyDB.db/";
    Database database =
        await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE EnglishToPolish (id INTEGER PRIMARY KEY, word TEXT, translation TEXT, topic TEXT)');
      await db.execute(
          'CREATE TABLE EnglishToFrench (id INTEGER PRIMARY KEY, word TEXT, translation TEXT, topic TEXT)');
      await db.execute(
          'CREATE TABLE EnglishToSpanish (id INTEGER PRIMARY KEY, word TEXT, translation TEXT, topic TEXT)');
      await db.execute(
          'CREATE TABLE PolishToEnglish (id INTEGER PRIMARY KEY, word TEXT, translation TEXT, topic TEXT)');
      await db.execute(
          'CREATE TABLE PolishToFrench (id INTEGER PRIMARY KEY, word TEXT, translation TEXT, topic TEXT)');
      await db.execute(
          'CREATE TABLE PolishToSpanish (id INTEGER PRIMARY KEY, word TEXT, translation TEXT, topic TEXT)');
      await db.execute(
          'CREATE TABLE profile (id INTEGER PRIMARY KEY,currentCourse TEXT, daysStreak INTEGER, learnedWords INTEGER, finishedTopics INTEGER, achievements INTEGER, themeMode TEXT, interfaceLanguage TEXT, EnglishPolish INTEGER,EnglishChinese INTEGER, EnglishSpanish INTEGER, PolishEnglish INTEGER, PolishChinese INTEGER, PolishSpanish INTEGER)');
    });
    await database.execute(
        'INSERT INTO profile (currentCourse, daysStreak, learnedWords, finishedTopics, achievements, themeMode, interfaceLanguage, EnglishPolish, EnglishChinese, EnglishSpanish, PolishEnglish, PolishChinese, PolishSpanish) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)',
        ['English', 0, 0, 0, 0, 'light', 'Polish', 0, 0, 0, 1, 0, 0]);
  }
@override
  Future<Map<String, String>> getCurrentCourseInformation() async {
    LocalDatabase localDB = LocalDatabase();
  Utility utility = Utility();
    var connection = await localDB.connect();

    var profile = await connection.rawQuery("SELECT * FROM profile");
    String currentCourse = profile.elementAt(0)['currentCourse'].toString();

    String interfaceLanguage =
        profile.elementAt(0)['interfaceLanguage'].toString();
    Map<String, String> map =
        utility.convertCurrentCourseName(currentCourse, interfaceLanguage);
  
    return map;
  }

  @override
  Future<List<CourseDto>> getUserLearnedWordies() async {
    LocalDatabase localdb = LocalDatabase();
    Database db = await localdb.connect();
    List<CourseDto> words = [];

    var currentCourse = await db.rawQuery("SELECT currentCourse FROM profile");
    if (currentCourse.isNotEmpty) {
      Map<String, String> map = await getCurrentCourseInformation();

      var learnedWords =
          await db.rawQuery("SELECT * FROM ${map['courseNameTable']}");
      for (int i = 0; i < learnedWords.length; i++) {
        words.add(CourseDto(
            translation: learnedWords[i]["translation"].toString(),
            word: learnedWords[i]["word"].toString()));
      }
    }
    await db.close();
    return words;
  }

  @override
  Future<List<CourseDto>> getUserLearnedWordiesWithSpecificTopic(
      String topic) async {
    LocalDatabase localdb = LocalDatabase();
    Database db = await localdb.connect();
    List<CourseDto> words = [];

    var currentCourse = await db.rawQuery("SELECT currentCourse FROM profile");
    if (currentCourse.isNotEmpty) {
      Map<String, String> map = await getCurrentCourseInformation();

      var learnedWords = await db.rawQuery(
          "SELECT * FROM ${map['courseNameTable']} WHERE topic =$topic");
      for (int i = 0; i < learnedWords.length; i++) {
        words.add(CourseDto(
            translation: learnedWords[i]["translation"].toString(),
            word: learnedWords[i]["word"].toString()));
      }
    }
    await db.close();
    return words;
  }

  @override
  void setupDatabase() async {
    LocalDatabase localDB = LocalDatabase();
    String databasePath = await getDatabasesPath();
    String path = "$databasePath/wordyDB.db/";

    bool exists = await databaseExists(path);
    var connection = await localDB.connect();
    if (!exists) {
      createDatabase();
      print("Creating Database...");
    } else {
      connection = await openDatabase(path);
      print("Database already exists at " + path + " + loading user data...");
    }
    await connection.close();
  }
}
