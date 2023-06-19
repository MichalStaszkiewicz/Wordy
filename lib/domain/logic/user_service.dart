import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:wordy/data/network/exceptions/session_verification_error.dart';
import 'package:wordy/data/network/request/login_user_request.dart';
import 'package:wordy/data/network/request/register_user_request.dart';
import 'package:wordy/domain/models/course.dart';
import 'package:wordy/domain/models/course_entry.dart';
import 'package:wordy/domain/repositiories/repository.dart';

import '../../Utility/locator/service_locator.dart';

import '../../Utility/socket_manager.dart';
import '../../data/network/exceptions/validation_error.dart';
import '../../data/network/request/models/login_user_request_model.dart';

import '../../utility/either.dart';

import '../models/active_course.dart';
import '../models/course_basic.dart';

import '../models/profile_data.dart';
import '../models/user_active_courses_progress.dart';
import '../models/user_course.dart';

class UserService {
  UserService(this._repository);
  final Repository _repository;
  Future<Either<Exception, ProfileData>> getProfileData() async {
    var token = await _repository.getTokenAccess();
    if (token.isError) {
      return Either.error(token.error);
    }

    var profileData = await _repository.getProfileData(token.data!);
    if (profileData.isError) {
      return Either.error(profileData.error!);
    }
    return Either.data(profileData.data!);
  }

  Future<Either<Exception, String>> getTokenAccess() async {
    var token = await _repository.getTokenAccess();
    if (token.isError) {
      return Either.error(token.error);
    }
    return Either.data(token.data!);
  }

  Future<Either<Exception, String>> getTokenRefresh() async {
    var token = await _repository.getTokenRefresh();
    if (token.isError) {
      return Either.error(token.error);
    }
    return Either.data(token.data!);
  }

  Future<Either<Exception, String>> switchInterfaceLangauge(
      String languageName, String token) async {
    var interfaceLanguage =
        await _repository.switchInterfaceLangauge(token, languageName);
    if (interfaceLanguage.isError) {
      return Either.error(interfaceLanguage.error);
    } else {
      return Either.data(interfaceLanguage.data);
    }
  }

  Future<Either<Exception, String>> getUserInterfaceLanguage() async {
    var interfaceLanguage = await _repository.getUserInterfaceLanguage();
    if (interfaceLanguage.isError) {
      return Either.error(interfaceLanguage.error);
    } else {
      return Either.data(interfaceLanguage.data);
    }
  }

  Future<Either<Exception, ActiveCourse>> getUserCurrentCourseProgress() async {
    var token = await getTokenAccess();
    if (token.isError) {
      return Either.error(token.error);
    }
    var course = await _repository.getUserCurrentCourseProgress(token.data!);
    if (course.isData) {
      return Either.data(course.data!);
    } else {
      return Either.error(course.error);
    }
  }

  Future<Either<Exception, List<Course>>> getAvailableCourses() async {
    var token = await getTokenAccess();
    var userInterfaceLanguage = await getUserInterfaceLanguage();
    if (token.isError) {
      return Either.error(token.error);
    }
    if (userInterfaceLanguage.isError) {
      return Either.error(userInterfaceLanguage.error);
    }

    var availableCoursesData =
        await _repository.getAvailableCourses(token.data!);
    if (availableCoursesData.isData) {
      List<Course> availableCourses = [];

      for (Course course in availableCoursesData.data!) {
        if (course.name.toLowerCase() !=
            userInterfaceLanguage.data!.toLowerCase()) {
          availableCourses.add(course);
        }
      }

      return Either.data(availableCourses);
    } else {
      return Either.error(availableCoursesData.error);
    }
  }

  Future<Either<Exception, UserActiveCoursesProgress>>
      getUserActiveCoursesProgress() async {
    var userId = await getTokenAccess();
    if (userId.isError) {
      return Either.error(SessionVerificationError(
          title: 'Session Error',
          message:
              "We couldn't verify your session. You will be logged out now. Sorry for the difficulties."));
    }
    var activeCourses =
        await _repository.getUserActiveCoursesProgress(userId.data!);
    if (activeCourses.isData) {
      return Either.data(activeCourses.data);
    } else {
      return Either.error(activeCourses.error);
    }
  }

  Future<void> updateRegisterationStatus(String token) async {
    await _repository.updateUserRegisterStatus(
      token,
    );
  }

  Future<Either<Exception, UserCourse>> updateUserCurrentCourse(
      String courseName) async {
    var token = await getTokenAccess();

    if (token.isError) {
      return Either.error(token.error);
    }

    var userInterfaceLanguage = await _repository.getUserInterfaceLanguage();

    if (userInterfaceLanguage.isError) {
      return Either.error(userInterfaceLanguage.error);
    }

    var updateCourse =
        await _repository.updateUserCurrentCourse(courseName, token.data!);
    if (updateCourse.isData) {
      return Either.data(updateCourse.data);
    } else {
      return Either.error(updateCourse.error!);
    }
  }

  Future<Either<Exception, UserCourse>> getUserCurrentCourse() async {
    final token = await locator<Repository>().getTokenAccess();
    if (token.isData) {
      var userCurrentCourse =
          await _repository.getUserCurrentCourse(token.data!);
      if (userCurrentCourse.isData) {
        return Either.data(userCurrentCourse.data);
      } else {
        return Either.error(userCurrentCourse.error!);
      }
    } else {
      return Either.error(token.error);
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

    var response =
        await _repository.loginUser(LoginUserRequest.fromJson(userAuthData));
    if (response.isData) {
      print("Access Token : " + response.data!.accessToken);
      print("Refresh Token : " + response.data!.refreshToken);
      _repository.saveTokenAccess(response.data!.accessToken);
      _repository.saveTokenRefresh(response.data!.refreshToken);
    } else {
      return Either.error(response.error!);
    }

    await _repository.synchronizeUserInterfaceLanguage();
    return Either.data(response.data!.accessToken);
  }

  Future<void> logOut() async {
    var token = await getTokenAccess();
    locator<SocketManager>().logOut(token.data!);
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
    if (responseMessage.isData) {
      return Either.data(responseMessage.data);
    } else {
      return Either.error(responseMessage.error!);
    }
  }
}
