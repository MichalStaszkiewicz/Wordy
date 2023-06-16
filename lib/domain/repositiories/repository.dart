import 'dart:async';

import 'package:dio/dio.dart';
import 'package:wordy/data/network/request/register_user_request.dart';
import 'package:wordy/domain/models/course.dart';
import 'package:wordy/domain/models/word.dart';

import '../../const/shared_preferences_keys.dart';
import '../../data/local/local_storage.dart';
import '../../data/network/remote_source.dart';
import '../../data/network/request/login_user_request.dart';
import '../../data/network/request/models/begginer_quiz_request_model.dart';

import '../../utility/either.dart';
import '../models/achievement.dart';
import '../models/active_course.dart';
import '../models/flash_card_data.dart';
import '../models/interface_language.dart';
import '../models/profile_data.dart';
import '../models/registeration_status.dart';

import '../models/user_active_courses_progress.dart';
import '../models/user_course.dart';
import '../models/user_settings.dart';
import '../models/word.dart';

class Repository {
  Repository(
    this._localSource,
    this._remoteSource,
  );
  final LocalStorage _localSource;
  final RemoteSource _remoteSource;
  Future<Either<DioError, ProfileData>> getProfileData(String token) async {
    var profileData = await _remoteSource.getProfileData(token);
    if (profileData.isData) {
      return Either.data(profileData.data!);
    } else {
      return Either.error(profileData.error);
    }
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

  Future<Either<DioError, String>> switchInterfaceLangauge(
      String token, String languageName) async {
    var response =
        await _remoteSource.switchInterfaceLanguage(token, languageName);
    if (response.isData) {
      return Either.data(response.data!.updatedLanguageName.toString());
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
      return Either.data(response.data!.learnedWords);
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

  Future<Either<DioError, String>> loginUser(LoginUserRequest request) async {
    var response = await _remoteSource.loginUser(request);
    if (response.isData) {
      return Either.data(response.data!.token);
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
      return Either.data(response.data!.learnedWords);
    } else {
      return Either.error(response.error);
    }
  }

  Future<Either<DioError, List<Word>>> getWordsByTopic(String topic) async {
    var response = await _remoteSource.getWordsByTopic(topic);
    if (response.isData) {
      return Either.data(response.data!.learnedWords);
    } else {
      return Either.error(response.error);
    }
  }

  Future<Either<Exception, String>> getUserInterfaceLanguage() async {
    var response = await _localSource.getUserInterfaceLanguage();

    if (response != null) {
      return Either.data(response);
    } else {
      return Either.error(Exception('User didnt set interface language'));
    }
  }

  Future<Either<Exception, String>> synchronizeUserInterfaceLanguage() async {
    final token = await _localSource.getUserId();
    if (token != null) {
      var response = await _remoteSource.getUserSettings(token);

      if (response.isData) {
        await _localSource
            .setUserInterfaceLanguage(response.data!.interfaceLanguage.name);
      } else {
        return Either.error(
            Exception('Error occured while synchronizing with server'));
      }
    }
    return Either.data("Unknown error when synchronizing with server");
  }

  Future<Either<Exception, String>> getToken() async {
    var response = await _localSource.getUserId();
    if (response != null) {
      return Either.data(response);
    } else {
      return Either.error(Exception('Local storage error'));
    }
  }

  void saveToken(String id) async {
    _localSource.setUserId(id);
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
