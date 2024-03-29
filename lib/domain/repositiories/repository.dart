import 'dart:async';

import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:wordy/const/consts.dart';

import 'package:wordy/data/network/request/register_user_request.dart';
import 'package:wordy/domain/models/course.dart';
import 'package:wordy/domain/models/word.dart';
import 'package:wordy/global/global_data_manager.dart';
import 'package:wordy/utility/locator/service_locator.dart';

import '../../data/local/local_storage.dart';
import '../../data/network/remote_source.dart';
import '../../data/network/request/login_user_request.dart';

import '../../data/network/response/login_user_response.dart';
import '../../data/network/response/update_user_interface_language_response.dart';
import '../../utility/either.dart';
import '../models/active_course.dart';
import '../models/flash_card_data.dart';
import '../models/interface_language.dart';
import '../models/profile_data.dart';
import '../models/registeration_status.dart';

import '../models/topic.dart';
import '../models/user_active_courses_progress.dart';
import '../models/user_course.dart';
import '../models/user_settings.dart';

class Repository {
  Repository(
    this._localSource,
    this._remoteSource,
  );
  final LocalStorage _localSource;
  final RemoteSource _remoteSource;
  void cleanUpLocalStorate() {
    _localSource.cleanup();
  }

  Future<Either<DioError, List<Topic>>> getTopics() async {
    var topics = await _remoteSource.getTopics();
    if (topics.isData) {
      return Either.data(topics.data!.topics);
    } else {
      return Either.error(topics.error);
    }
  }

  Future<Either<DioError, String>> recoverAccount(String email) async {
    var profileData = await _remoteSource.recoverAccount(email);
    if (profileData.isData) {
      return Either.data(profileData.data!);
    } else {
      return Either.error(profileData.error);
    }
  }

  Future<Either<DioError, ProfileData>> getProfileData(String token) async {
    var profileData = await _remoteSource.getProfileData(token);
    if (profileData.isData) {
      return Either.data(profileData.data!);
    } else {
      return Either.error(profileData.error);
    }
  }

  Future<Either<Exception, String>> validateResetPasswordToken(
      String email, String token) async {
    var tokenState = await _remoteSource.validateResetPassword(email, token);
    if (tokenState.isError) {
      return Either.error(tokenState.error);
    }
    return Either.data(tokenState.data!);
  }

  Future<Either<Exception, String>> updatePassword(
      String email, String password) async {
    var updateState = await _remoteSource.updateUserPassword(email, password);
    if (updateState.isError) {
      return Either.error(updateState.error);
    }
    return Either.data(updateState.data!);
  }

  Future<Either<DioError, ActiveCourse>> getUserCurrentCourseProgress(
      String userId) async {
    var course = await _remoteSource.getUserCurrentCourseProgress(userId);
    if (course.isData) {
      return Either.data(course.data!);
    } else {
      return Either.error(course.error);
    }
  }

  Future<Either<DioError, List<Course>>> getAvailableCourses(
      String userId) async {
    var courses = await _remoteSource.getAvailableCourses(userId);
    if (courses.isData) {
      return Either.data(courses.data!.courses);
    } else {
      return Either.error(courses.error);
    }
  }

  Future<Either<DioError, UserActiveCoursesProgress>>
      getUserActiveCoursesProgress(String userId) async {
    var response = await _remoteSource.getUserActiveCoursesProgress(userId);

    if (response.isData) {
      return Either.data(response.data!);
    } else {
      return Either.error(response.error);
    }
  }

  Future<Either<DioError, UpdateUserInterfaceLanguageResponse>>
      switchInterfaceLangauge(String token, String languageName) async {
    var response =
        await _remoteSource.switchInterfaceLanguage(token, languageName);
    if (response.isData) {
      return Either.data(response.data!);
    } else {
      return Either.error(response.error);
    }
  }

  Future<Either<DioError, RegisterationStatus>> getRegisterationStatus(
      String token) async {
    var response = await _remoteSource.getRegisterationStatus(token);

    if (response.isData) {
      return Either.data(RegisterationStatus(
          registerationCompleted: response.data!.registerationCompleted));
    } else {
      return Either.error(response.error);
    }
  }

  Future<Either<DioError, UserSettings>> getUserSettings(String token) async {
    var response = await _remoteSource.getUserSettings(token);
    if (response.isData) {
      return Either.data(response.data!);
    } else {
      return Either.error(response.error);
    }
  }

  Future<Either<DioError, String>> insertLearnedWordList(
      List<int> wordIdList, String token) async {
    var response = await _remoteSource.insertLearnedWordList(wordIdList, token);
    if (response.isData) {
      return Either.data('Success');
    } else {
      return Either.error(response.error);
    }
  }

  Future<Either<DioError, List<Word>>> getLearnedWordList(String token) async {
    var response = await _remoteSource.getLearnedWordList(token);
    if (response.isData) {
      return Either.data(response.data!.knownWords);
    } else {
      return Either.error(response.error);
    }
  }

  Future<Either<DioError, List<Word>>> getBeginnerQuizWordList(
      String topic, String token) async {
    var response = await _remoteSource.getBeginnerQuizWordList(topic, token);
    if (response.isData) {
      return Either.data(response.data!.wordList);
    } else {
      return Either.error(response.error);
    }
  }

  Future<Either<DioError, List<FlashCardData>>> createFlashCardList(
      String topic, String token) async {
    var response = await _remoteSource.createFlashCardList(topic, token);
    if (response.isData) {
      return Either.data(response.data!.wordList
          .map((e) => FlashCardData(question: e.question, answer: e.answer))
          .toList());
    } else {
      return Either.error(response.error);
    }
  }

  Future<Either<DioError, UserCourse>> updateUserCurrentCourse(
      String courseName, String token) async {
    var response = await _remoteSource.switchCurrentCourse(courseName, token);
    if (response.isData) {
      return Either.data(response.data!.updatedCourse);
    } else {
      return Either.error(response.error);
    }
  }

  Future<Either<DioError, UserCourse>> getUserCurrentCourse(
      String token) async {
    var response = await _remoteSource.getUserCurrentCourse(token);
    if (response.isData) {
      return Either.data(response.data!);
    } else {
      return Either.error(response.error);
    }
  }

  Future<Either<DioError, String>> updateUserRegisterStatus(
      String token) async {
    var response = await _remoteSource.updateRegisterationStatus(token);
    if (response.isData) {
      return Either.data(response.data!.message);
    } else {
      return Either.error(response.error);
    }
  }

  Future<Either<DioError, List<InterfaceLanguage>>>
      getAvailableLanguages() async {
    var response = await _remoteSource.getAvailableLanguages();
    if (response.isData) {
      return Either.data(response.data!.languages);
    } else {
      return Either.error(response.error);
    }
  }

  Future<Either<DioError, LoginUserResponse>>? loginUser(
      LoginUserRequest request) async {
    var response = await _remoteSource.loginUser(request);
    if (response.isData) {
      return Either.data(response.data!);
    } else {
      return Either.error(response.error);
    }
  }

  Future<Either<DioError, String>> registerUser(
      RegisterUserRequest request) async {
    var response = await _remoteSource.registerUser(request);
    if (response.isData) {
      return Either.data(response.data!.message);
    } else {
      return Either.error(response.error);
    }
  }

  Future<Either<DioError, List<Word>>> getLearnedWordsByTopic(
      String topic, String token) async {
    var response = await _remoteSource.getLearnedWordsByTopic(topic, token);
    if (response.isData) {
      return Either.data(response.data!.knownWords);
    } else {
      return Either.error(response.error);
    }
  }

  Future<Either<DioError, List<Word>>> getWordsByTopic(String topic) async {
    var response = await _remoteSource.getWordsByTopic(topic);
    if (response.isData) {
      return Either.data(response.data!.knownWords);
    } else {
      return Either.error(response.error);
    }
  }

  Either<Exception, String>? getUserInterfaceLanguage() {
    var response = _localSource.getUserInterfaceLanguage();

    if (response != null && response != '') {
      return Either.data(response);
    }
    return Either.error(Exception(
        translate['english']!['error_messages']['interface_language_not_set']));
  }

  Future<Either<Exception, String>>? synchronizeUserInterfaceLanguage() async {
    final token = _localSource.getTokenAccess();
    if (token != null) {
      var response = await _remoteSource.getUserSettings(token);

      if (response.isData) {
        _localSource
            .setUserInterfaceLanguage(response.data!.interfaceLanguage.name);
      } else {
        return Either.error(
            Exception('Error occured while synchronizing with server'));
      }
    }
    return Either.data("Unknown error when synchronizing with server");
  }

  Future<Either<Exception, String>>? getTokenAccess() async {
    var response = _localSource.getTokenAccess();
    if (response != null) {
      return Either.data(response);
    } else {
      return Either.error(Exception('Local storage error'));
    }
  }

  Future<Either<Exception, String>>? getTokenRefresh() async {
    var response = await _localSource.getTokenRefresh();
    if (response != null) {
      return Either.data(response);
    } else {
      return Either.error(Exception('Local storage error'));
    }
  }

  void saveTokenAccess(String token) async {
    _localSource.setTokenAccess(token);
  }

  void saveTokenRefresh(String token) async {
    _localSource.setTokenRefresh(token);
  }

  Future<Either<DioError, bool>> cancelRequest() async {
    var response = await _remoteSource.cancelRequest();

    if (response.isData) {
      return Either.error(response.error);
    } else {
      return Either.data(response.data);
    }
  }
}

class RepositoryMock extends Mock implements Repository {}
