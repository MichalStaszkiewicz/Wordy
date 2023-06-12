import 'dart:async';

import 'package:dio/dio.dart';
import 'package:wordy/data/network/request/register_user_request.dart';
import 'package:wordy/domain/models/course.dart';
import 'package:wordy/domain/models/learned_word.dart';

import '../../data/dto/profile_data.dart';
import '../../data/local/local_storage.dart';
import '../../data/network/remote_source.dart';
import '../../data/network/request/login_user_request.dart';
import '../../data/network/request/models/begginer_quiz_request_model.dart';

import '../../utility/either.dart';
import '../models/achievement.dart';
import '../models/active_course.dart';
import '../models/beginner_quiz_question.dart';
import '../models/flash_card_data.dart';
import '../models/interface_language.dart';
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
    if (profileData.isRight) {
      return Either.data(profileData.right!);
    } else {
      return Either.error(profileData.left);
    }
  }

  Future<Either<DioError, ActiveCourse>> getUserCurrentCourseProgress(
      String userId) async {
    var course = await _remoteSource.getUserCurrentCourseProgress(userId);
    if (course.isRight) {
      return Either.data(course.right!.toDomain());
    } else {
      return Either.error(course.left);
    }
  }

  Future<Either<DioError, List<Course>>> getAvailableCourses(
      String userId) async {
    var courses = await _remoteSource.getAvailableCourses(userId);
    if (courses.isRight) {
      return Either.data(
          courses.right!.courses.map((e) => e.toDomain()).toList());
    } else {
      return Either.error(courses.left);
    }
  }

  Future<Either<DioError, UserActiveCoursesProgress>>
      getUserActiveCoursesProgress(String userId) async {
    var response = await _remoteSource.getUserActiveCoursesProgress(userId);

    if (response.isRight) {
      return Either.data(response.right!.toDomain());
    } else {
      return Either.error(response.left);
    }
  }

  Future<Either<DioError, String>> switchInterfaceLangauge(
      String token, String languageName) async {
    var response =
        await _remoteSource.switchInterfaceLanguage(token, languageName);
    if (response.isRight) {
      return Either.data(response.right!.message);
    } else {
      return Either.error(response.left);
    }
  }

  Future<Either<DioError, RegisterationStatus>> getRegisterationStatus(
      String token) async {
    var response = await _remoteSource.getRegisterationStatus(token);

    if (response.isRight) {
      return Either.data(response.right!.toDomain());
    } else {
      return Either.error(response.left);
    }
  }

  Future<Either<DioError, UserSettings>> getUserSettings(String token) async {
    var response = await _remoteSource.getUserSettings(token);
    if (response.isRight) {
      return Either.data(response.right!.toDomain());
    } else {
      return Either.error(response.left);
    }
  }

  Future<Either<DioError, String>> insertLearnedWordList(
      List<int> wordIdList, String token) async {
    var response = await _remoteSource.insertLearnedWordList(wordIdList, token);
    if (response.isRight) {
      return Either.data('Success');
    } else {
      return Either.error(response.left);
    }
  }

  Future<Either<DioError, List<LearnedWord>>> getLearnedWordList(
      String token) async {
    var response = await _remoteSource.getLearnedWordList(token);
    if (response.isRight) {
      return Either.data(
          response.right!.learnedWords.map((e) => e.toDomain()).toList());
    } else {
      return Either.error(response.left);
    }
  }

  Future<Either<DioError, List<BeginnerQuizQuestion>>> getBeginnerQuizWordList(
      String topic, String token) async {
    var response = await _remoteSource.getBeginnerQuizWordList(topic, token);
    if (response.isRight) {
      return Either.data(response.right!.beginnerQuizWordList
          .map((e) => e.toDomain())
          .toList());
    } else {
      return Either.error(response.left);
    }
  }

  Future<Either<DioError, List<FlashCardData>>> createFlashCardList(
      String topic) async {
    var response = await _remoteSource.createFlashCardList(topic);
    if (response.isRight) {
      return Either.data(
          response.right!.wordList.map((e) => e.toDomain()).toList());
    } else {
      return Either.error(response.left);
    }
  }

  Future<Either<DioError, UserCourse>> updateUserCurrentCourse(
      String courseName, String token) async {
    var response = await _remoteSource.switchCurrentCourse(courseName, token);
    if (response.isRight) {
      return Either.data(response.right!.updatedCourse.toDomain());
    } else {
      return Either.error(response.left);
    }
  }

  Future<Either<DioError, UserCourse>> getUserCurrentCourse(
      String token) async {
    var response = await _remoteSource.getUserCurrentCourse(token);
    if (response.isRight) {
      return Either.data(response.right!.toDomain());
    } else {
      return Either.error(response.left);
    }
  }

  Future<Either<DioError, bool>> updateUserRegisterStatus(String token) async {
    var response = await _remoteSource.updateRegisterationStatus(token);
    if (response.isRight) {
      return Either.data(response.right!.updatedRegisterStatus);
    } else {
      return Either.error(response.left);
    }
  }

  Future<Either<DioError, List<InterfaceLanguage>>>
      getAvailableLanguages() async {
    var response = await _remoteSource.getAvailableLanguages();
    if (response.isRight) {
      return Either.data(
          response.right!.languages.map((e) => e.toDomain()).toList());
    } else {
      return Either.error(response.left);
    }
  }

  Future<Either<DioError, String>> loginUser(LoginUserRequest request) async {
    var response = await _remoteSource.loginUser(request);
    if (response.isRight) {
      return Either.data(response.right!.token);
    } else {
      return Either.error(response.left);
    }
  }

  Future<Either<DioError, String>> registerUser(
      RegisterUserRequest request) async {
    var response = await _remoteSource.registerUser(request);
    if (response.isRight) {
      return Either.data(response.right!.message);
    } else {
      return Either.error(response.left);
    }
  }

  Future<Either<DioError, List<Word>>> getLearnedWordsByTopic(
      String topic, String token) async {
    var response = await _remoteSource.getLearnedWordsByTopic(topic, token);
    if (response.isRight) {
      return Either.data(
          response.right!.wordList.map((e) => e.toDomain()).toList());
    } else {
      return Either.error(response.left);
    }
  }

  Future<Either<DioError, List<Word>>> getWordsByTopic(String topic) async {
    var response = await _remoteSource.getWordsByTopic(topic);
    if (response.isRight) {
      return Either.data(
          response.right!.wordList.map((e) => e.toDomain()).toList());
    } else {
      return Either.error(response.left);
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

      if (response.isRight) {
        await _localSource
            .setUserInterfaceLanguage(response.right!.interfaceLanguage.name);
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

    if (response.isRight) {
      return Either.error(response.left);
    } else {
      return Either.data(response.right);
    }
  }
}
