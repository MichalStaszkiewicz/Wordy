import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wordy/utility/c_achievment.dart';
import 'package:wordy/data/dto/course_basic._dto.dart';
import 'package:wordy/data/dto/course_entry_dto.dart';
import 'package:wordy/data/local/local_repository_implementation.dart';
import 'package:wordy/data/network/remote_source.dart';
import 'package:wordy/domain/models/achievement_old.dart';
import 'package:wordy/domain/models/course.dart';
import 'package:wordy/domain/models/course_entry.dart';
import 'package:wordy/domain/repositiories/repository.dart';

import '../../data/network/api_response.dart';
import '../models/achievement.dart';
import '../models/achievements_base.dart';
import '../models/course_basic.dart';
import '../models/user.dart';
import '../result.dart';

class UserDataLogic {
  UserDataLogic();
  final Repository repository = Repository();
  final LocalRepository _localRepository = LocalRepository();
  Future<String> loginUser(User user) async {
    try {
      final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      if (user.email.isEmpty || user.fullName!.isEmpty) {
        throw Exception("Fill all fields");
      }

      if (!emailRegExp.hasMatch(user.email)) {
        throw Exception("Bad email format");
      }

      return await repository.loginUser(user).then((value) => value.message);
    } on Exception catch (e) {
      rethrow;
    }
  }

  Future<String> registerUser(User user) async {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (user.email.isEmpty || user.fullName!.isEmpty) {
      throw Exception("Fill all fields");
    }

    if (!emailRegExp.hasMatch(user.email)) {
      throw Exception("Bad email format");
    }
    if (user.password.length < 5) {
      throw Exception("Password is too short");
    }
    try {
      String responseData =
          await repository.registerUser(user).then((value) => value.message);

      return responseData;
    } on Exception catch (e) {
      rethrow;
    }
  }

  Future<void> insertNewAchievementID(String achievementID) async {
    await _localRepository.insertDataToAchievement(achievementID);
  }

  Future<List<Achievement>> getNonAchievedAchievements() async {
    List<Achievement> achievements = await repository
        .getAllAchievements()
        .then((value) => value.achievements.map((e) => e.toDomain()).toList());
    List<int> achievementIds = achievements.map((e) => e.id).toList();

    List<Achievement> result = [];
    for (int i = 0; i < achievements.length; i++) {
      if (!achievementIds.contains(i)) {
        result.add(achievements[i]);
      }
    }
    return result;
  }

  Future<List<Achievement>> getAllAchievements() async {
    RemoteSource remoteSource = RemoteSource();
    return await remoteSource
        .getAllAchievements()
        .then((value) => value.achievements.map((e) => e.toDomain()).toList());
  }

  Future<List<Achievement>> getUserAchievements(int userID) async {
    List<Achievement> achievements = await repository
        .getUserAchievements(userID)
        .then((value) => value.achievements.map((e) => e.toDomain()).toList());

    return achievements;
  }

  Future<int> getUserLearnedWordiesToday() async {
    // implement logic here
    return 200;
  }

  Future<void> increaseLearnedWordsToday(List<CourseEntry> entries) async {
    //implement logic here
  }

  Future<void> increaseUserHotStreak() async {
    // implement logic here
  }

  Future<int> getUserHotStreak() async {
    // implenment logic here
    return 2;
  }

  void insertLearnedWordsToDatabase(List<CourseEntry> wordsToInsert) async {
    // implement logic here
  }

  Future<List<CourseBasic>> getActiveCourses() async {
    // implement logic here

    return [];
  }

  Future<bool> getFirstRun() async {
    //implement logic
    return false;
  }

  Future<int> getFinishedTopicsCount() async {
    //implement logic
    return 4;
  }

  Future<int> getLearnedWordiesCount() async {
    //implement logic
    return 4;
  }

  Future<List<Course>> getCoursesData() async {
    //implement logic

    return [];
  }
}
