import 'package:wordy/data/dto/login_user_response.dart';
import 'package:wordy/data/dto/update_user_interface_language_response.dart';
import 'package:wordy/data/dto/user_response.dart';
import 'package:wordy/data/local/local_repository_implementation.dart';
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
import '../../localizator.dart';
import '../models/achievement.dart';
import '../models/course_basic.dart';
import '../models/interface_language.dart';
import '../models/user.dart';

class UserDataLogic {
  UserDataLogic();
  final Repository _repository = Repository();

  User _userInstance = locator.get<User>();
  Future<bool> updateUserRegisterStatus(String userId) async {
    try {
      return await _repository
          .updateUserRegisterStatus(UpdateRegisterStatusRequest(userId: userId))
          .then((value) => value.updatedRegisterStatus);
    } on Exception catch (e) {
      rethrow;
    }
  }

  Future<InterfaceLanguage> getUserInterfaceLanguage(String userId) async {
    try {
      InterfaceLanguageResponse response =
          await _repository.getUserInterfaceLanguage(userId);

      return response.toDomain();
    } on Exception catch (e) {
      rethrow;
    }
  }

  Future<Course> updateUserCurrentCourse(
      UpdateUserCurrentCourseModel requetModel) async {
    try {
      Course updateCourse = await _repository.updateUserCurrentCourse(
          UpdateUserCurrentCourseRequest.fromJson(requetModel.toMap()));

      return updateCourse;
    } on Exception catch (e) {
      rethrow;
    }
  }

  Future<void> updateUserInterfaceLanguage(
      UpdateUserInterfaceLanguageModel requestModel) async {
    try {
      UpdateUserInterfaceLanguageResponse response =
          await _repository.updateUserInterfaceLanguage(
              UpdateUserInterfaceLanguageRequest.fromJson(
                  requestModel.toMap()));
      _userInstance.userSettings!.language.name = response.updatedLanguageName;
      print(response.message);
      print('Updated interface language to: ${response.updatedLanguageName}');
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

      _userInstance = await _repository
          .loginUser(LoginUserRequest.fromJson(userAuthData))
          .then((value) => value.user.toDomain());
      if (_userInstance.id != null) {
        _userInstance.registersationStatus =
            await _repository.registerationStatus(_userInstance.id!);
        _userInstance.userSettings = await _repository.getUserSettings(
            UserSettingsRequestModel(userId: _userInstance.id!));
      }
    } on Exception catch (e) {
      rethrow;
    }
  }

  Future<bool> registerationStatus(String userId) async {
    try {
      return await _repository
          .registerationStatus(userId)
          .then((value) => value.registerationCompleted);
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
