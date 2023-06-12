import 'package:wordy/data/network/exceptions/session_verification_error.dart';
import 'package:wordy/data/network/request/login_user_request.dart';
import 'package:wordy/data/network/request/register_user_request.dart';
import 'package:wordy/domain/models/course.dart';
import 'package:wordy/domain/models/course_entry.dart';
import 'package:wordy/domain/repositiories/repository.dart';

import '../../Utility/locator/service_locator.dart';
import '../../data/dto/profile_data.dart';
import '../../data/network/exceptions/validation_error.dart';
import '../../data/network/request/models/login_user_request_model.dart';

import '../../utility/either.dart';

import '../models/active_course.dart';
import '../models/course_basic.dart';

import '../models/user_active_courses_progress.dart';
import '../models/user_course.dart';

class UserService {
  UserService(this._repository);
  final Repository _repository;
  Future<Either<Exception, ProfileData>> getProfileData() async {
    var token = await _repository.getToken();
    if (token.isLeft) {
      return Either.error(token.left);
    }

    var profileData = await _repository.getProfileData(token.right!);
    if (profileData.isLeft) {
      return Either.error(profileData.left!);
    }
    return Either.data(profileData.right!);
  }

  Future<Either<Exception, String>> switchInterfaceLangauge(
      String languageName, String token) async {
    var interfaceLanguage =
        await _repository.switchInterfaceLangauge(token, languageName);
    if (interfaceLanguage.isLeft) {
      return Either.error(interfaceLanguage.left);
    } else {
      return Either.data(interfaceLanguage.right);
    }
  }

  Future<Either<Exception, String>> getUserInterfaceLanguage() async {
    var interfaceLanguage = await _repository.getUserInterfaceLanguage();
    if (interfaceLanguage.isLeft) {
      return Either.error(interfaceLanguage.left);
    } else {
      return Either.data(interfaceLanguage.right);
    }
  }

  Future<Either<Exception, ActiveCourse>> getUserCurrentCourseProgress() async {
    var token = await _repository.getToken();
    if (token.isLeft) {
      return Either.error(token.left);
    }
    var course = await _repository.getUserCurrentCourseProgress(token.right!);
    if (course.isRight) {
      return Either.data(course.right!);
    } else {
      return Either.error(course.left);
    }
  }

  Future<Either<Exception, List<Course>>> getAvailableCourses() async {
    var token = await _repository.getToken();
    var userInterfaceLanguage = await getUserInterfaceLanguage();
    if (token.isLeft) {
      return Either.error(token.left);
    }
    if (userInterfaceLanguage.isLeft) {
      return Either.error(userInterfaceLanguage.left);
    }

    var courses = await _repository.getAvailableCourses(token.right!);
    if (courses.isRight) {
      courses.right!.removeWhere((element) =>
          element.name.toLowerCase() ==
          userInterfaceLanguage.right!.toLowerCase());
      return Either.data(courses.right!);
    } else {
      return Either.error(courses.left);
    }
  }

  Future<Either<Exception, UserActiveCoursesProgress>>
      getUserActiveCoursesProgress() async {
    var userId = await _repository.getToken();
    if (userId.isLeft) {
      return Either.error(SessionVerificationError(
          title: 'Session Error',
          message:
              "We couldn't verify your session. You will be logged out now. Sorry for the difficulties."));
    }
    var activeCourses =
        await _repository.getUserActiveCoursesProgress(userId.right!);
    if (activeCourses.isRight) {
      return Either.data(activeCourses.right);
    } else {
      return Either.error(activeCourses.left);
    }
  }

  Future<void> updateRegisterationStatus(String token) async {
    await _repository.updateUserRegisterStatus(
      token,
    );
  }

  Future<Either<Exception, UserCourse>> updateUserCurrentCourse(
      String courseName) async {
    var token = await _repository.getToken();
    var userInterfaceLanguage = await _repository.getUserInterfaceLanguage();
    if (userInterfaceLanguage.isLeft) {
      return Either.error(userInterfaceLanguage.left);
    }
    if (token.isLeft) {
      return Either.error(token.left);
    }

    var updateCourse =
        await _repository.updateUserCurrentCourse(courseName, token.right!);
    if (updateCourse.isRight) {
      return Either.data(updateCourse.right);
    } else {
      return Either.error(updateCourse.left!);
    }
  }

  Future<Either<Exception, UserCourse>> getUserCurrentCourse() async {
    final token = await locator<Repository>().getToken();
    if (token.isRight) {
      var userCurrentCourse =
          await _repository.getUserCurrentCourse(token.right!);
      if (userCurrentCourse.isRight) {
        return Either.data(userCurrentCourse.right);
      } else {
        return Either.error(userCurrentCourse.left!);
      }
    } else {
      return Either.error(token.left);
    }
  }

  Future<Either<Exception, String>> loginUser(
      LoginUserModel requestModel) async {
    Map<String, dynamic> userAuthData = requestModel.toMap();

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (userAuthData['email'] == null || userAuthData['password'] == null) {
      return Either.error(
          ValidationError(message: 'Fill all fields', 'Validation Error'));
    }

    if (!emailRegExp.hasMatch(userAuthData['email'])) {
      return Either.error(
          ValidationError(message: 'Bad email format', 'Validation Error'));
    }

    var token =
        await _repository.loginUser(LoginUserRequest.fromJson(userAuthData));
    if (token.isRight) {
      _repository.saveToken(token.right!);
    } else {
      return Either.error(token.left!);
    }

    await _repository.synchronizeUserInterfaceLanguage();
    return Either.data(token.right);
  }

  Future<Either<Exception, String>> registerUser(
      Map<String, dynamic> userAuthData) async {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (userAuthData['email'] == null || userAuthData['password'] == null) {
      return Either.error(
          ValidationError('Validation Error', message: 'Fill all fields'));
    }

    if (!emailRegExp.hasMatch(userAuthData['email'])) {
      return Either.error(
          ValidationError('Validation Error', message: 'Bad email format'));
    }
    if ((userAuthData['password'] as String).length < 5) {
      return Either.error(ValidationError('Validation Error',
          message: 'Password is too short'));
    }

    var responseMessage = await _repository
        .registerUser(RegisterUserRequest.fromJson(userAuthData));
    if (responseMessage.isRight) {
      return Either.data(responseMessage.right);
    } else {
      return Either.error(responseMessage.left!);
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
