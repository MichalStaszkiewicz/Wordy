import 'package:sqflite/sqflite.dart';

class Utility {
  Utility();
  Map<String, String> convertCurrentCourseName(String courseName) {
    Map<String, String> map = {};
    String courseNameTable = "";
    String languageThatUserWillLearnFrom = "";
    String languageToLearn = "";
    bool space = false;

    for (int i = 0; i < courseName.length; i++) {
      if (courseName[i] != " ") {
        courseNameTable += courseName[i];
        if (space == false) {
          languageThatUserWillLearnFrom += courseName[i];
        } else {
          languageToLearn += courseName[i];
        }
      }
      if (courseName[i] == " ") {
        courseNameTable += "To";
        space = true;
      }
    }
    map.addAll({
      "courseNameTable": courseNameTable,
      "languageThatUserWillLearnFrom": languageThatUserWillLearnFrom,
      "languageToLearn": languageToLearn
    });
    return map;
  }

  void createDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = "$databasePath/wordyDB.db/";
    Database database =
        await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE EnglishToPolish (id INTEGER PRIMARY KEY, word TEXT, translation TEXT, topic TEXT, learned INTEGER)');
      await db.execute(
          'CREATE TABLE EnglishToChinese (id INTEGER PRIMARY KEY, word TEXT, translation TEXT, topic TEXT, learned INTEGER)');
      await db.execute(
          'CREATE TABLE EnglishToSpanish (id INTEGER PRIMARY KEY, word TEXT, translation TEXT, topic TEXT, learned INTEGER)');
      await db.execute(
          'CREATE TABLE PolishToEnglish (id INTEGER PRIMARY KEY, word TEXT, translation TEXT, topic TEXT, learned INTEGER)');
      await db.execute(
          'CREATE TABLE PolishToChinese (id INTEGER PRIMARY KEY, word TEXT, translation TEXT, topic TEXT, learned INTEGER)');
      await db.execute(
          'CREATE TABLE PolishToSpanish (id INTEGER PRIMARY KEY, word TEXT, translation TEXT, topic TEXT, learned INTEGER)');
      await db.execute(
          'CREATE TABLE profile (id INTEGER PRIMARY KEY,currentCourse TEXT, daysStreak INTEGER, learnedWords INTEGER, finishedTopics INTEGER, achievements INTEGER, themeMode TEXT, interfaceLanguage INTEGER, EnglishPolish INTEGER,EnglishChinese INTEGER, EnglishSpanish INTEGER, PolishEnglish INTEGER, PolishChinese INTEGER, PolishSpanish INTEGER)');
    });
    int id = await database.rawInsert(
        'INSERT INTO profile (currentCourse, daysStreak, learnedWords, finishedTopics, achievements, themeMode, interfaceLanguage, EnglishPolish, EnglishChinese, EnglishSpanish, PolishEnglish, PolishChinese, PolishSpanish) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)',
        ['Polish English', 0, 0, 0, 0, 'light', 'Polish', 0, 0, 0, 1, 0, 0]);
    print("Successfully added record into profile with id: $id");
  }
}
