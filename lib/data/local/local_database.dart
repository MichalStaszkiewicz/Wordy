import 'package:sqflite/sqflite.dart';
import 'package:wordy/Utility/utility.dart';

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

  Map<String, String> convertCurrentCourseName(
      String courseName, String interfaceLanguage) {
    Map<String, String> map = {};
    String courseNameTable = "${interfaceLanguage}To$courseName";
 
    map.addAll({
      "courseNameTable": courseNameTable,
      "courseName": courseName,
      "interfaceLanguage": interfaceLanguage
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
          'CREATE TABLE EnglishToFrench (id INTEGER PRIMARY KEY, word TEXT, translation TEXT, topic TEXT, learned INTEGER)');
      await db.execute(
          'CREATE TABLE EnglishToSpanish (id INTEGER PRIMARY KEY, word TEXT, translation TEXT, topic TEXT, learned INTEGER)');
      await db.execute(
          'CREATE TABLE PolishToEnglish (id INTEGER PRIMARY KEY, word TEXT, translation TEXT, topic TEXT, learned INTEGER)');
      await db.execute(
          'CREATE TABLE PolishToFrench (id INTEGER PRIMARY KEY, word TEXT, translation TEXT, topic TEXT, learned INTEGER)');
      await db.execute(
          'CREATE TABLE PolishToSpanish (id INTEGER PRIMARY KEY, word TEXT, translation TEXT, topic TEXT, learned INTEGER)');
      await db.execute(
          'CREATE TABLE profile (id INTEGER PRIMARY KEY,currentCourse TEXT, daysStreak INTEGER, learnedWords INTEGER, finishedTopics INTEGER, achievements INTEGER, themeMode TEXT, interfaceLanguage TEXT, EnglishPolish INTEGER,EnglishChinese INTEGER, EnglishSpanish INTEGER, PolishEnglish INTEGER, PolishChinese INTEGER, PolishSpanish INTEGER)');
    });
    await database.execute(
        'INSERT INTO profile (currentCourse, daysStreak, learnedWords, finishedTopics, achievements, themeMode, interfaceLanguage, EnglishPolish, EnglishChinese, EnglishSpanish, PolishEnglish, PolishChinese, PolishSpanish) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)',
        ['English', 0, 0, 0, 0, 'light', 'Polish', 0, 0, 0, 1, 0, 0]);
  }

  Future<Map<String, String>> getCurrentCourseInformation() async {
    Utility utility = Utility();
    var profile = await _db.rawQuery("SELECT * FROM profile");
    String currentCourse = profile.elementAt(0)['currentCourse'].toString();
    String interfaceLanguage =
        profile.elementAt(0)['interfaceLanguage'].toString();
       
    Map<String, String> map =
        convertCurrentCourseName(currentCourse, interfaceLanguage);

    return map;
  }

  void setupDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = "$databasePath/wordyDB.db/";
    Utility utility = Utility();
    bool exists = await databaseExists(path);
    if (!exists) {
      createDatabase();
      print("Creating Database...");
    } else {
      _db = await openDatabase(path);
      print("Database already exists at " + path + " + loading user data...");
    }
  }

  void close() {
    _db.close();
  }
}
