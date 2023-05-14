import 'package:sqflite/sqflite.dart';
import 'package:wordy/Utility/utility.dart';
import 'package:wordy/data/dto/course_basic._dto.dart';
import 'package:wordy/data/dto/course_entry_dto.dart';
import 'package:wordy/data/local/local_database.dart';
import 'package:wordy/domain/models/achievement_old.dart';

import 'package:wordy/domain/repositiories/local_database_interface_repository.dart';
import 'package:wordy/const/consts.dart';

import '../../domain/models/course_entry.dart';
import '../../domain/models/course_profile.dart';
import '../dto/course_dto.dart';
import '../dto/word_dto.dart';
import '../network/network_repository_implementation.dart';
import '../network/remote_source.dart';

class LocalRepository implements LocalInterface {
  final List<String> _databaseCourseTables = [
    "EnglishToPolish",
    "EnglishToFrench",
    "EnglishToSpanish",
    "PolishToEnglish",
    "PolishToFrench",
    "PolishToSpanish"
  ];
  Map<String, List<String>> availableCourses() {
    Map<String, List<String>> result = {};

    result.addAll({
      "Polish": ["English", "French", "Spanish"],
      "English": ["Polish", "French", "Spanish"],
    });
    return result;
  }

  Future<List<int>> getAchievementsIds() async {
    LocalDatabase localDatabase = LocalDatabase();
    var connection = await localDatabase.connect();
    var achievements = await connection.rawQuery("SELECT * FROM Achievements");
    List<int> result = [];
    for (int i = 0; i < achievements.length; i++) {
      result.add(int.parse(achievements[i]["achievementID"].toString()));
    }
    return result;
  }

  Future<List<double>> getPercentageOfEveryCourse() async {
    RemoteSource remote = RemoteSource();
    int courseMaxWordies = 0;
    remote.getAllWords().then((value) => courseMaxWordies = value.wordList.length);
    List<int> captureLearnedWordiesByCourse = [];
    for (String tableName in _databaseCourseTables) {
      captureLearnedWordiesByCourse
          .add(await getLearnedWordiesCountByTableName(tableName));
    }
    List<double> result = [];
    for (int i in captureLearnedWordiesByCourse) {
      result.add((i / courseMaxWordies) * 100);
    }
    return result;
  }

  Future<int> countLearnedWordies() async {
    Map<String, List<String>> avCourses = availableCourses();
    Map<String, dynamic> userData = await getUserData();
    Utility utility = Utility();
    int sum = 0;
    for (String courseName in avCourses[userData['interfaceLanguage']]!) {
      Map<String, dynamic> courseData = utility.convertCurrentCourseName(
          courseName, userData['interfaceLanguage']!);
      int test = await getLearnedWordiesCountByTableName(
          courseData['courseNameTable']!);

      sum += test;
    }

    return sum;
  }

  Future<int> countUserFinishedTopics() async {
   
 
    return 4;
  }

  Future<List<CourseDto>> getUserWordsLearnedByCurrentNativeLanguage() async {
  

    return [];
  }

  @override
  Future<void> createDatabase(
    String userNativeLanguage,
    String languageToLearn,
  ) async {
    String databasePath = await getDatabasesPath();
    String path = "$databasePath/wordyDB.db/";
    bool exist = await databaseExists(path);
    if (exist) {
      return;
    } else {
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
            'CREATE TABLE Achievements (id INTEGER PRIMARY KEY,achievementID INTEGER)');

        await db.execute(
            'CREATE TABLE profile (id INTEGER PRIMARY KEY,firstRun INTEGER,currentCourse TEXT, daysStreak INTEGER, learnedWords INTEGER, finishedTopics INTEGER, achievements INTEGER, themeMode TEXT, interfaceLanguage TEXT,English INTEGER,French INTEGER, Polish INTEGER,Spanish INTEGER , lastLesson TEXT,wordsLearnedToday INTEGER)');
      });

      await database.execute(
          'INSERT INTO profile (currentCourse,firstRun, daysStreak, learnedWords, finishedTopics, achievements, themeMode, interfaceLanguage, English,French, Polish,Spanish,lastLesson,wordsLearnedToday) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)',
          ['', 1, 0, 0, 0, 0, 'light', userNativeLanguage, 0, 0, 0, 0, '', 0]);
    }
  }

  @override
  Future<void> updateUserProfile(String fieldToUpdate, String value) async {
    LocalDatabase localDB = LocalDatabase();
    var connection = await localDB.connect();
    await connection
        .rawQuery("UPDATE profile SET $fieldToUpdate = '$value' WHERE id = 1");
  }

  @override
  Future<Map<String, dynamic>> getUserData() async {
    LocalDatabase localDB = LocalDatabase();
    Utility utility = Utility();
    List<CourseBasicDto> courses = [];
    var connection = await localDB.connect();

    var profile = await connection.rawQuery("SELECT * FROM profile");
    for (CourseProfile kcourseProfile in kCourses) {
      if (profile.elementAt(0)[kcourseProfile.dbNotation] == 1) {
        courses.add(CourseBasicDto(
            flag: kcourseProfile.flag,
            language: kcourseProfile.language,
            nativeLanguage: kcourseProfile.native));
      }
    }
    String daysStreak = profile.elementAt(0)['daysStreak'].toString();
    String currentCourse = profile.elementAt(0)['currentCourse'].toString();
    String lastLesson = profile.elementAt(0)['lastLesson'].toString();
    String interfaceLanguage =
        profile.elementAt(0)['interfaceLanguage'].toString();
    String wordsLearnedToday =
        profile.elementAt(0)['wordsLearnedToday'].toString();
    String themeMode = profile.elementAt(0)['themeMode'].toString();
    String firstRun = profile.elementAt(0)['firstRun'].toString();
    Map<String, dynamic> map =
        utility.convertCurrentCourseName(currentCourse, interfaceLanguage);
    map.addAll({
      "themeMode": themeMode,
      "firstRun": firstRun,
      "activeCourses": courses,
      "daysStreak": daysStreak,
      "lastLesson": lastLesson,
      "wordsLearnedToday": wordsLearnedToday,
    });

    return map;
  }

  @override
  Future<void> insertLearnedWordsToDatabase(List<CourseEntry> words) async {
    LocalDatabase localDB = LocalDatabase();
    Map<String, dynamic> userInformations = await getUserData();
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
  Future<List<CourseEntryDto>>
      getUserLearnedWordiesByCurrentNativeLanguage() async {
    LocalDatabase localdb = LocalDatabase();
    Database db = await localdb.connect();
    List<CourseEntryDto> words = [];

    var currentCourse = await db.rawQuery("SELECT currentCourse FROM profile");
    if (currentCourse.isNotEmpty) {
      Map<String, dynamic> map = await getUserData();

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
      Map<String, dynamic> map = await getUserData();

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

    bool exists = await databaseExists(path);
    var connection = await localDB.connect();
    if (!exists) {
      await connection.close();

      return false;
    } else {
      connection = await openDatabase(path);

      await connection.close();

      return true;
    }
  }

  Future<int> getLearnedWordiesCount() async {
    LocalDatabase localdb = LocalDatabase();
    Database db = await localdb.connect();
    int result = 0;

    for (String tableName in _databaseCourseTables) {
      var queryResult = await db.rawQuery("SELECT COUNT(id) FROM $tableName");
      result += int.parse(queryResult[0]["COUNT(id)"].toString());
    }

    await db.close();
    return result;
  }

  @override
  Future<int> getLearnedWordiesCountByTableName(String tableName) async {
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
    Database database_connection = await localdb.connect();

    var queryResult = await database_connection
        .rawQuery("SELECT COUNT(id) FROM $tableName WHERE Topic = '$topic'");

    await database_connection.close();
    return int.parse(queryResult[0]["COUNT(id)"].toString());
  }

  @override
  Future<void> updateDatabaseTable(
      String tableName, String fieldToUpdate, String value) async {
    LocalDatabase localdb = LocalDatabase();
    Database database_connection = await localdb.connect();

    await database_connection.rawQuery(
        "UPDATE $tableName SET $fieldToUpdate = '$value' WHERE id = 1");
  }

  Future<void> insertDataToAchievement(String value) async {
    LocalDatabase localdb = LocalDatabase();
    Database database_connection = await localdb.connect();

    String query = "INSERT INTO Achievements (achievementID) VALUES ('$value')";

    await database_connection.transaction((txn) async {
      await txn.rawInsert(query);
    });
  }
  
}
