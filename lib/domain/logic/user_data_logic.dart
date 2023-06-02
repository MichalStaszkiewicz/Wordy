import 'package:wordy/data/dto/login_user_response.dart';
import 'package:wordy/data/dto/update_user_interface_language_response.dart';
import 'package:wordy/data/dto/user_response.dart';
import 'package:wordy/data/network/remote_source.dart';
import 'package:wordy/data/network/request/login_user_request.dart';
import 'package:wordy/data/network/request/models/user_settings_request_model.dart';
import 'package:wordy/data/network/request/register_user_request.dart';
import 'package:wordy/domain/models/achievement_old.dart';
import 'package:wordy/domain/models/course.dart';
import 'package:wordy/domain/models/course_entry.dart';
import 'package:wordy/domain/models/registeration_status.dart';
import 'package:wordy/domain/repositiories/repository.dart';
import 'package:wordy/presentation/Bloc/settings/settings_bloc.dart';
import '../../data/dto/interface_language_response.dart';
import '../../data/dto/update_user_current_course_response.dart';
import '../../data/network/request/models/login_user_request_model.dart';
import '../../data/network/request/models/update_user_current_course_request_model.dart';
import '../../data/network/request/models/update_user_interface_language_request_model.dart';
import '../../data/network/request/update_register_status_request.dart';
import '../../data/network/request/update_user_current_course_request.dart';
import '../../data/network/request/update_user_interface_language_request.dart';
import '../../utility/locator/storage_locator.dart';
import '../models/achievement.dart';
import '../models/course_basic.dart';
import '../models/interface_language.dart';

import '../models/user_course.dart';

class UserDataLogic {
  UserDataLogic(this._repository);
  final Repository _repository;
  Future<void> updateRegisterationStatus(bool status, String userId) async {
    await _repository.updateUserRegisterStatus(UpdateRegisterStatusRequest(
      userId: userId,
    ));
  }

  Future<UserCourse> updateUserCurrentCourse(
      UpdateUserCurrentCourseModel requetModel) async {
    try {
      UserCourse updateCourse = await _repository.updateUserCurrentCourse(
          UpdateUserCurrentCourseRequest.fromJson(requetModel.toMap()));

      return updateCourse;
    } on Exception catch (e) {
      rethrow;
    }
  }

  Future<UserCourse> getUserCurrentCourse() async {
    try {
      final userId = await locator<Repository>().getUserId();
      if (userId != null) {
        UserCourse userCurrentCourse =
            await _repository.getUserCurrentCourse(userId);

        return userCurrentCourse;
      } else {
        throw Exception('Something went wrong');
      }
    } on Exception catch (e) {
      rethrow;
    }
  }

  Future<void> loginUser(LoginUserModel requestModel) async {
    try {
      Map<String, dynamic> userAuthData = requestModel.toMap();
      final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      if (userAuthData['email'] == null || userAuthData['password'] == null) {
        throw Exception("Fill all fields");
      }

      if (!emailRegExp.hasMatch(userAuthData['email'])) {
        throw Exception("Bad email format");
      }

      String userId = await _repository
          .loginUser(LoginUserRequest.fromJson(userAuthData))
          .then((value) => value.user.id);
      _repository.setUserId(userId);

      await _repository.synchronizeUserInterfaceLanguage();
    } on Exception catch (e) {
      rethrow;
    }
  }

  Future<String> registerUser(Map<String, dynamic> userAuthData) async {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (userAuthData['email'] == null || userAuthData['password'] == null) {
      throw Exception("Fill all fields");
    }

    if (!emailRegExp.hasMatch(userAuthData['email'])) {
      throw Exception("Bad email format");
    }
    if ((userAuthData['password'] as String).length < 5) {
      throw Exception("Password is too short");
    }
    try {
      String responseMessage = await _repository
          .registerUser(RegisterUserRequest.fromJson(userAuthData))
          .then((value) => value.message);

      return responseMessage;
    } on Exception catch (e) {
      rethrow;
    }
  }

  Future<void> insertNewAchievementID(String achievementID) async {
    // await _localRepository.insertDataToAchievement(achievementID);
  }

  Future<List<Achievement>> getNonAchievedAchievements() async {
    List<Achievement> achievements = await _repository
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

/*
  Future<List<Achievement>> getAllAchievements() async {
    RemoteSource remoteSource = RemoteSource();
    return await remoteSource
        .getAllAchievements()
        .then((value) => value.achievements.map((e) => e.toDomain()).toList());
  }

  Future<List<Achievement>> getUserAchievements(int userID) async {
    List<Achievement> achievements = await _repository
        .getUserAchievements(userID)
        .then((value) => value.achievements.map((e) => e.toDomain()).toList());

    return achievements;
  }
*/
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
