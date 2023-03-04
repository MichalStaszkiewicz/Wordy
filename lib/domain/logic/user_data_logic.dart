import 'package:wordy/data/dto/course_basic._dto.dart';
import 'package:wordy/data/dto/course_entry_dto.dart';
import 'package:wordy/data/local/local_repository_implementation.dart';
import 'package:wordy/domain/models/course.dart';
import 'package:wordy/domain/models/course_entry.dart';

import '../models/course_basic.dart';

class UserDataLogic {
  UserDataLogic();
  final LocalRepository _localRepository = LocalRepository();
  Future<String> getUserLastLessonDate() async {
    Map<String, dynamic> snapshot = await _localRepository.getUserData();

    return snapshot['lastLesson'];
  }

  Future<void> increaseLearnedWordsToday(List<CourseEntry> entries) async {
    DateTime todayDate = DateTime.now();

    DateTime todayDateCorrected =
        DateTime(todayDate.year, todayDate.month, todayDate.day);
    String lastLesson = await getUserLastLessonDate();

    if (DateTime.parse(lastLesson) == todayDateCorrected) {
      int userLearnedWordiesToday =
          await getUserLearnedWordiesToday();
      List<CourseEntry> wordiesThatUserAlreadyKnow = [];
      await _localRepository.getUserLearnedWordies().then((words) {
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
      print("its user first lesson ever");
      return;
    } else {
      int hotStreak = int.parse(snapshot['daysStreak']);
      DateTime lastLessonDateFormat = DateTime.parse(lastLesson);
      if (lastLessonDateFormat == yesterday) {
        print("its user first lesson today");
        String updatedStreak = hotStreak++ as String;
        _localRepository.updateUserProfile('daysStreak', updatedStreak);
        _localRepository.updateUserProfile(
            'lastLesson', todayDateCorrected.toString());
        return;
      } else if (lastLessonDateFormat == todayDateCorrected) {
        print("its user second or more lesson today");
        print("date today: " + todayDateCorrected.toString());
        print("lastLesson: " + lastLesson.toString());

        return;
      } else {
        print(
            "user broke streak and its his first lesson since 2 days or more");
        print("his last lesson is: " + lastLesson.toString());
        print("date today: " + todayDateCorrected.toString());
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
        .getUserLearnedWordies()
        .then((value) => value.map((e) => e.toDomain()).toList());
    List<CourseEntry> result = [];

    for (CourseEntry word in wordsToInsert) {
      if (!userLearnedWordsAlready.contains(word)) {
        result.add(word);
      }
      _localRepository.insertLearnedWordsToDatabase(result);
    }
  }

  Future<void> updateDatabase(String fieldToUpdate, String value) async {
    _localRepository.updateUserProfile(fieldToUpdate, value);
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

  Future<int> getUserLearnedWordiesToday() async {
    Map<String, dynamic> userData = await _localRepository.getUserData();

    return  int.parse(userData['wordsLearnedToday'].toString());
  }

  Future<int> getLearnedWordiesCount() async {
    return await _localRepository.countLearnedWordies();
  }

  Future<List<Course>> getCoursesData() async {
    List<Course> result = await _localRepository
        .getUserWordsLearned()
        .then((value) => value.map((e) => e.toDomain()).toList());

    return result;
  }
}
