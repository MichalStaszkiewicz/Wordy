import 'package:sqflite/sqflite.dart';
import 'package:wordy/Utility/utility.dart';
import 'package:wordy/data/dto/course_entry_dto.dart';
import 'package:wordy/data/local/local_database.dart';

import 'package:wordy/domain/repositiories/local_database_interface_repository.dart';
import 'package:wordy/shared/consts.dart';

import '../../domain/models/course.dart';
import '../../domain/models/course_entry.dart';
import '../dto/course_dto.dart';
import '../dto/word_dto.dart';
import '../network/network_repository_implementation.dart';

class LocalRepository implements LocalInterface {
  Map<String, List<String>> availableCourses() {
    Map<String, List<String>> result = {};

    result.addAll({
      "Polish": ["English", "French", "Spanish"],
      "English": ["Polish", "French", "Spanish"],
    });
    return result;
  }

  Future<int> countLearnedWordies() async {
    Map<String, List<String>> avCourses = availableCourses();
    Map<String, String> userData = await getUserData();
    Utility utility = Utility();
    int sum = 0;
    for (String courseName in avCourses[userData['interfaceLanguage']]!) {
      Map<String, String> courseData = utility.convertCurrentCourseName(
          courseName, userData['interfaceLanguage']!);

      sum += await getLearnedWordiesCount(courseData['courseNameTable']!);
    }
    return sum;
  }

  Future<int> countUserFinishedTopics() async {
    ServerDatabaseOperations remote = ServerDatabaseOperations();
    int result = 0;
    Map<String, List<String>> avCourses = availableCourses();
    Map<String, String> userData = await getUserData();
    Utility utility = Utility();

    for (String topic in topics) {
      int remoteCount = await remote.getWordiesCountByTopic(topic);
      for (String courseName in avCourses[userData['interfaceLanguage']]!) {
        Map<String, String> courseData = utility.convertCurrentCourseName(
            courseName, userData['interfaceLanguage']!);
        int localCount = await getLearnedWordiesCountByTopic(
            topic, courseData['courseNameTable']!);
        if (remoteCount == localCount) {
          result++;
        }
      }
    }
    return result;
  }

  Future<List<CourseDto>> getUserWordsLearned() async {
    ServerDatabaseOperations remote = ServerDatabaseOperations();
    Map<String, List<String>> avCourses = availableCourses();
    Map<String, String> userData = await getUserData();
    Utility utility = Utility();

    List<WordDto> allWords = await remote.getAllWordies();
    List<CourseDto> allCourses = [];
    for (String courseName in avCourses[userData['interfaceLanguage']]!) {
      Map<String, String> courseData = utility.convertCurrentCourseName(
          courseName, userData['interfaceLanguage']!);
      List<CourseEntryDto> entries =
          await getUserLearnedWordiesWithSpecificNameTable(
              courseData['courseNameTable']!);
      Map<String, int> topicsMaximum = {};
      Map<String, int> topicsCurrent = {};
      for (String topic in topics) {
        topicsMaximum
            .addAll({topic: await remote.getWordiesCountByTopic(topic)});
        topicsCurrent.addAll({
          topic: await getLearnedWordiesCountByTopic(
              topic, courseData['courseNameTable']!)
        });
      }
      allCourses.add(CourseDto(
          courseName: courseName,
          entries: entries,
          maximum: allWords.length,
          topicsMaximum: topicsMaximum,
          current: entries.length,
          topicsCurrent: topicsMaximum));
    }

    return allCourses;
  }

  @override
  Future<void> createDatabase(String userNativeLanguage,String languageToLearn) async {
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
          'CREATE TABLE profile (id INTEGER PRIMARY KEY,currentCourse TEXT, daysStreak INTEGER, learnedWords INTEGER, finishedTopics INTEGER, achievements INTEGER, themeMode TEXT, interfaceLanguage TEXT, EnglishPolish INTEGER,EnglishChinese INTEGER, EnglishSpanish INTEGER, PolishEnglish INTEGER, PolishChinese INTEGER, PolishSpanish INTEGER, firstOpen INTEGER)');
    });
    await database.execute(
        'INSERT INTO profile (currentCourse, daysStreak, learnedWords, finishedTopics, achievements, themeMode, interfaceLanguage, EnglishPolish, EnglishChinese, EnglishSpanish, PolishEnglish, PolishChinese, PolishSpanish,firstOpen) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)',
        [languageToLearn, 0, 0, 0, 0, 'light', userNativeLanguage, 0, 0, 0, 1, 0, 0,0]);
  }

  @override
  void updateUserProfile(String fieldToUpdate, String value) async {
    LocalDatabase localDB = LocalDatabase();
    var connection = await localDB.connect();
    await connection
        .rawQuery("UPDATE profile SET $fieldToUpdate = '$value' WHERE id = 1");
  }

  @override
  Future<Map<String, String>> getUserData() async {
    LocalDatabase localDB = LocalDatabase();
    Utility utility = Utility();
    var connection = await localDB.connect();

    var profile = await connection.rawQuery("SELECT * FROM profile");
    String currentCourse = profile.elementAt(0)['currentCourse'].toString();

    String interfaceLanguage =
        profile.elementAt(0)['interfaceLanguage'].toString();
    String themeMode = profile.elementAt(0)['themeMode'].toString();
    Map<String, String> map =
        utility.convertCurrentCourseName(currentCourse, interfaceLanguage);
    map.addAll({"themeMode": themeMode});

    return map;
  }

  @override
  void insertLearnedWordsToDatabase(List<CourseEntry> words) async {
    LocalDatabase localDB = LocalDatabase();
    Map<String, String> userInformations = await getUserData();
    String tableName = userInformations['courseNameTable']!;
    var connection = await localDB.connect();
    for (CourseEntry word in words) {
      await connection.execute(
          'INSERT INTO $tableName (word, translation, topic) VALUES (?,?,?)',
          [word.translation, word.word, word.topic]);
    }

    await connection.close();
  }

  Future<List<CourseEntryDto>> getUserLearnedWordiesWithSpecificNameTable(
      String nameTable) async {
    LocalDatabase localdb = LocalDatabase();
    Database db = await localdb.connect();
    List<CourseEntryDto> words = [];

    var learnedWords = await db.rawQuery("SELECT * FROM $nameTable");

    for (int i = 0; i < learnedWords.length; i++) {
      words.add(CourseEntryDto(
          translation: learnedWords[i]["translation"].toString(),
          word: learnedWords[i]["word"].toString(),
          topic: learnedWords[i]['topic'].toString()));
    }
    await db.close();
    return words;
  }

  @override
  Future<List<CourseEntryDto>> getUserLearnedWordies() async {
    LocalDatabase localdb = LocalDatabase();
    Database db = await localdb.connect();
    List<CourseEntryDto> words = [];

    var currentCourse = await db.rawQuery("SELECT currentCourse FROM profile");
    if (currentCourse.isNotEmpty) {
      Map<String, String> map = await getUserData();

      var learnedWords =
          await db.rawQuery("SELECT * FROM ${map['courseNameTable']}");

      for (int i = 0; i < learnedWords.length; i++) {
        words.add(CourseEntryDto(
            translation: learnedWords[i]["translation"].toString(),
            word: learnedWords[i]["word"].toString(),
            topic: learnedWords[i]['topic'].toString()));
      }
    }
    await db.close();
    return words;
  }

  @override
  Future<List<CourseEntryDto>> getUserLearnedWordiesWithSpecificTopic(
      String topic) async {
    LocalDatabase localdb = LocalDatabase();
    Database db = await localdb.connect();
    List<CourseEntryDto> words = [];

    var currentCourse = await db.rawQuery("SELECT currentCourse FROM profile");
    if (currentCourse.isNotEmpty) {
      Map<String, String> map = await getUserData();

      var learnedWords = await db.rawQuery(
          "SELECT * FROM ${map['courseNameTable']} WHERE topic = \'$topic\'");
      for (int i = 0; i < learnedWords.length; i++) {
        words.add(CourseEntryDto(
            translation: learnedWords[i]["translation"].toString(),
            word: learnedWords[i]["word"].toString(),
            topic: learnedWords[i]['topic'].toString()));
      }
    }
    await db.close();
    return words;
  }

  @override
  Future<bool> setupDatabase() async {
    LocalDatabase localDB = LocalDatabase();
    String databasePath = await getDatabasesPath();
    String path = "$databasePath/wordyDB.db/";
    bool st = false;

    bool exists = await databaseExists(path);
    var connection = await localDB.connect();
    if (!exists) {

    
      await connection.close();
      print("STATE OF DB: " + st.toString());
      return false;
    } else {
      connection = await openDatabase(path);
      print("Database already exists at " + path + " + loading user data...");
      await connection.close();
      st = true;
      print("STATE OF DB: " + st.toString());
      return true;
    }
  }

  @override
  Future<int> getLearnedWordiesCount(String tableName) async {
    LocalDatabase localdb = LocalDatabase();
    Database db = await localdb.connect();

    var queryResult = await db.rawQuery("SELECT COUNT(id) FROM $tableName");

    await db.close();
    return int.parse(queryResult[0]["COUNT(id)"].toString());
  }

  @override
  Future<int> getLearnedWordiesCountByTopic(
      String topic, String tableName) async {
    LocalDatabase localdb = LocalDatabase();
    Database db = await localdb.connect();

    var queryResult = await db
        .rawQuery("SELECT COUNT(id) FROM $tableName WHERE Topic = '$topic'");

    await db.close();
    return int.parse(queryResult[0]["COUNT(id)"].toString());
  }
}
