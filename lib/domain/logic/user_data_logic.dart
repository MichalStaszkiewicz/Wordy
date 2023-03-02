import 'package:wordy/data/dto/course_basic._dto.dart';
import 'package:wordy/data/local/local_repository_implementation.dart';
import 'package:wordy/domain/models/course.dart';
import 'package:wordy/domain/models/course_entry.dart';

import '../models/course_basic.dart';

class UserDataLogic {
  UserDataLogic();
  final LocalRepository _localRepository = LocalRepository();
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
for(CourseBasicDto basicDto in snapshot['activeCourses']){

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
        .getUserWordsLearned()
        .then((value) => value.map((e) => e.toDomain()).toList());

    return result;
  }
}
