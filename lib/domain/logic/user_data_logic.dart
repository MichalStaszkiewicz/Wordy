import 'package:wordy/Utility/c_achievment.dart';
import 'package:wordy/data/dto/course_basic._dto.dart';
import 'package:wordy/data/dto/course_entry_dto.dart';
import 'package:wordy/data/local/local_repository_implementation.dart';
import 'package:wordy/domain/models/achievement.dart';
import 'package:wordy/domain/models/course.dart';
import 'package:wordy/domain/models/course_entry.dart';

import '../models/achievements_base.dart';
import '../models/course_basic.dart';

class UserDataLogic {
  UserDataLogic();
  final LocalRepository _localRepository = LocalRepository();
  Future<String> getUserLastLessonDate() async {
    Map<String, dynamic> snapshot = await _localRepository.getUserData();

    return snapshot['lastLesson'];
  }

  Future<Map<String, dynamic>> sessionEndCheckIfNewAchievementAvailable(
      double precision) {
    CAchievement achievementHelper = CAchievement();
    return achievementHelper.gainAchievement(precision);
  }

  Future<List<Achievement>> getNonAchievedAchievements() async {
    List<int> achievementIds = await _localRepository.getAchievementsIds();
    CAchievement achievementHelper = CAchievement();
    int achievementsCount = achievementHelper.getAchievementsCount();
    List<Achievement> result = [];
    for (int i = 0; i < achievementsCount; i++) {
      if (!achievementIds.contains(i)) {
        Achievement? achiv =
            await achievementHelper.convertIdIntoAchievemnet(i, null);
        if (achiv != null) {
          result.add(achiv);
        }
      }
    }
    return result;
  }

  Future<List<Achievement>> getAllAchievements() async {
    CAchievement achievementHelper = CAchievement();

    return await achievementHelper.getAllAchievements();
  }

  Future<List<Achievement>> getUserAchievements() async {
    List<int> achievementIds = await _localRepository.getAchievementsIds();
    CAchievement achievementHelper = CAchievement();
    List<Achievement> achievements = [];
    for (int i = 0; i < achievementIds.length; i++) {
      Achievement? achiv =
          await achievementHelper.convertIdIntoAchievemnet(i, null);
      if (achiv != null) {
        achievements.add(achiv);
      }
    }
    return achievements;
  }

  Future<int> getUserLearnedWordiesToday() async {
    Map<String, dynamic> userData = await _localRepository.getUserData();

    return int.parse(userData['wordsLearnedToday'].toString());
  }

  Future<void> increaseLearnedWordsToday(List<CourseEntry> entries) async {
    DateTime todayDate = DateTime.now();

    DateTime todayDateCorrected =
        DateTime(todayDate.year, todayDate.month, todayDate.day);
    String lastLesson = await getUserLastLessonDate();

    if (DateTime.parse(lastLesson) == todayDateCorrected) {
      int userLearnedWordiesToday = await getUserLearnedWordiesToday();
      List<CourseEntry> wordiesThatUserAlreadyKnow = [];
      await _localRepository
          .getUserLearnedWordiesByCurrentNativeLanguage()
          .then((words) {
        for (CourseEntryDto entryDto in words) {
          wordiesThatUserAlreadyKnow.add(entryDto.toDomain());
        }
      });
      int countNewWordies = 0;
      for (CourseEntry entry in entries) {
        if (!wordiesThatUserAlreadyKnow.contains(entry)) {
          countNewWordies++;
        }
      }
      int result = userLearnedWordiesToday + countNewWordies;
      _localRepository.updateUserProfile(
          'wordsLearnedToday', result.toString());
    }
  }

  Future<void> increaseUserHotStreak() async {
    Map<String, dynamic> snapshot = await _localRepository.getUserData();
    DateTime todayDate = DateTime.now();

    DateTime todayDateCorrected =
        DateTime(todayDate.year, todayDate.month, todayDate.day);
    DateTime yesterday = DateTime(todayDateCorrected.year,
        todayDateCorrected.month, todayDateCorrected.day - 1);
    String lastLesson = await getUserLastLessonDate();

    if (lastLesson == "") {
      _localRepository.updateUserProfile(
          'lastLesson', todayDateCorrected.toString());
      _localRepository.updateUserProfile('daysStreak', '1');

      return;
    } else {
      int hotStreak = int.parse(snapshot['daysStreak']);
      DateTime lastLessonDateFormat = DateTime.parse(lastLesson);
      if (lastLessonDateFormat == yesterday) {
        hotStreak++;
        String updatedStreak = hotStreak.toString();
        _localRepository.updateUserProfile('daysStreak', updatedStreak);
        _localRepository.updateUserProfile(
            'lastLesson', todayDateCorrected.toString());
        return;
      } else if (lastLessonDateFormat == todayDateCorrected) {
        return;
      } else {
        _localRepository.updateUserProfile('daysStreak', '1');
        _localRepository.updateUserProfile(
            'lastLesson', todayDateCorrected.toString());
      }
    }
  }

  Future<int> getUserHotStreak() async {
    Map<String, dynamic> snapshot = await _localRepository.getUserData();
    DateTime todayDate = DateTime.now();
    DateTime todayDateCorrected =
        DateTime(todayDate.year, todayDate.month, todayDate.day);
    DateTime yesterday = DateTime(todayDateCorrected.year,
        todayDateCorrected.month, todayDateCorrected.day - 1);
    String lastLesson = await getUserLastLessonDate();

    if (lastLesson == "") {
      return 0;
    } else {
      DateTime lastLessonDateFormat = DateTime.parse(lastLesson);
      if (lastLessonDateFormat != todayDateCorrected &&
          lastLessonDateFormat != yesterday) {
        _localRepository.updateUserProfile('daysStreak', '0');
        return 0;
      } else {
        return int.parse(snapshot['daysStreak']);
      }
    }
  }

  void insertLearnedWordsToDatabase(List<CourseEntry> wordsToInsert) async {
    List<CourseEntry> userLearnedWordsAlready = await _localRepository
        .getUserLearnedWordiesByCurrentNativeLanguage()
        .then((value) => value.map((e) => e.toDomain()).toList());
    List<CourseEntry> result = [];

    for (CourseEntry word in wordsToInsert) {
      if (!userLearnedWordsAlready.contains(word)) {
        result.add(word);
      }
      _localRepository.insertLearnedWordsToDatabase(result);
    }
  }

  Future<void> updateDatabase(String fieldToUpdate, String value,
      String? tableName, String type) async {
    if (type == "Profile") {
      _localRepository.updateUserProfile(fieldToUpdate, value);
    } else {
      if (tableName != null) {
        _localRepository.updateDatabaseTable(tableName, fieldToUpdate, value);
      } else {
        assert(true, "INVALID TABLE");
      }
    }
  }

  Future<List<CourseBasic>> getActiveCourses() async {
    Map<String, dynamic> snapshot = await _localRepository.getUserData();
    List<CourseBasic> basicCourses = [];
    for (CourseBasicDto basicDto in snapshot['activeCourses']) {
      basicCourses.add(basicDto.toDomain());
    }
    return basicCourses;
  }

  Future<bool> getFirstRun() async {
    Map<String, dynamic> snapshot = await _localRepository.getUserData();
    int firstRun = int.parse(snapshot['firstRun']!);

    return firstRun == 0 ? false : true;
  }

  Future<int> getFinishedTopicsCount() async {
    return await _localRepository.countUserFinishedTopics();
  }

 

  Future<int> getLearnedWordiesCount() async {
    return await _localRepository.countLearnedWordies();
  }

  Future<List<Course>> getCoursesData() async {
    List<Course> result = await _localRepository
        .getUserWordsLearnedByCurrentNativeLanguage()
        .then((value) => value.map((e) => e.toDomain()).toList());

    return result;
  }
}
