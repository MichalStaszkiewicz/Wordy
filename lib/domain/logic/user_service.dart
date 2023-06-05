import 'package:dio/src/dio_error.dart';
import 'package:wordy/data/dto/login_user_response.dart';
import 'package:wordy/data/dto/update_user_interface_language_response.dart';
import 'package:wordy/data/dto/user_response.dart';
import 'package:wordy/data/network/exceptions/api_errors/api_error_message.dart';
import 'package:wordy/data/network/exceptions/exception_helper.dart';
import 'package:wordy/data/network/remote_source.dart';
import 'package:wordy/data/network/request/login_user_request.dart';
import 'package:wordy/data/network/request/models/user_settings_request_model.dart';
import 'package:wordy/data/network/request/register_user_request.dart';
import 'package:wordy/domain/models/achievement_old.dart';
import 'package:wordy/domain/models/course.dart';
import 'package:wordy/domain/models/course_entry.dart';
import 'package:wordy/domain/models/registeration_status.dart';
import 'package:wordy/domain/repositiories/repository.dart';
import 'package:wordy/domain/repositiories/user_repository.dart';
import 'package:wordy/presentation/Bloc/settings/settings_bloc.dart';
import '../../data/dto/interface_language_response.dart';
import '../../data/dto/update_user_current_course_response.dart';
import '../../data/network/exceptions/validation_error.dart';
import '../../data/network/request/models/login_user_request_model.dart';
import '../../data/network/request/models/update_user_current_course_request_model.dart';
import '../../data/network/request/models/update_user_interface_language_request_model.dart';
import '../../data/network/request/update_register_status_request.dart';
import '../../data/network/request/update_user_current_course_request.dart';
import '../../data/network/request/update_user_interface_language_request.dart';
import '../../utility/either.dart';
import '../../utility/locator/storage_locator.dart';
import '../models/achievement.dart';
import '../models/course_basic.dart';
import '../models/interface_language.dart';

import '../models/user_course.dart';

class UserService {
  UserService(this._repository);
  final Repository _repository;
  Future<void> updateRegisterationStatus(bool status, String userId) async {
    await _repository.updateUserRegisterStatus(UpdateRegisterStatusRequest(
      userId: userId,
    ));
  }

  Future<Either<String, UserCourse>> updateUserCurrentCourse(
      UpdateUserCurrentCourseModel requetModel) async {
    var updateCourse = await _repository.updateUserCurrentCourse(
        UpdateUserCurrentCourseRequest.fromJson(requetModel.toMap()));
    if (updateCourse.isRight) {
      return Either.right(updateCourse.right);
    } else {
      return Either.left(updateCourse.left!.message);
    }
  }

  Future<Either<Exception, UserCourse>> getUserCurrentCourse() async {
    final userId = await locator<Repository>().getUserId();
    if (userId.isRight) {
      var userCurrentCourse =
          await _repository.getUserCurrentCourse(userId.right!);
      if (userCurrentCourse.isRight) {
        return Either.right(userCurrentCourse.right);
      } else {
        return Either.left(userCurrentCourse.left!);
      }
    } else {
      return Either.left(userId.left);
    }
  }

  Future<Either<Exception, String>> loginUser(
      LoginUserModel requestModel) async {
    Map<String, dynamic> userAuthData = requestModel.toMap();

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (userAuthData['email'] == null || userAuthData['password'] == null) {
      return Either.left(
          ValidationError(message: 'Fill all fields', 'Validation Error'));
    }

    if (!emailRegExp.hasMatch(userAuthData['email'])) {
      return Either.left(
          ValidationError(message: 'Bad email format', 'Validation Error'));
    }

    var userId =
        await _repository.loginUser(LoginUserRequest.fromJson(userAuthData));
    if (userId.isRight) {
      _repository.setUserId(userId.right!);
    } else {
      return Either.left(userId.left!);
    }

    await _repository.synchronizeUserInterfaceLanguage();
    return Either.right('Success');
  }

  Future<Either<Exception, String>> registerUser(
      Map<String, dynamic> userAuthData) async {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (userAuthData['email'] == null || userAuthData['password'] == null) {
      return Either.left(
          ValidationError('Validation Error', message: 'Fill all fields'));
    }

    if (!emailRegExp.hasMatch(userAuthData['email'])) {
      return Either.left(
          ValidationError('Validation Error', message: 'Bad email format'));
    }
    if ((userAuthData['password'] as String).length < 5) {
      return Either.left(ValidationError('Validation Error',
          message: 'Password is too short'));
    }

    var responseMessage = await _repository
        .registerUser(RegisterUserRequest.fromJson(userAuthData));
    if (responseMessage.isRight) {
      return Either.right(responseMessage.right);
    } else {
      return Either.left(responseMessage.left!);
    }
  }
}

Future<void> insertNewAchievementID(String achievementID) async {
  // await _localRepository.insertDataToAchievement(achievementID);
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
