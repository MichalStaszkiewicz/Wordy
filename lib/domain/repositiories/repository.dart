import 'dart:async';
import 'dart:ffi';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:wordy/const/shared_preferences_keys.dart';
import 'package:wordy/data/dto/beginner_quiz_word_list_response.dart';
import 'package:wordy/data/dto/language_list_response.dart';
import 'package:wordy/data/dto/login_user_response.dart';
import 'package:wordy/data/dto/register_user_response.dart';
import 'package:wordy/data/dto/update_user_interface_language_response.dart';
import 'package:wordy/data/network/request/models/insert_learned_words.request.model.dart';
import 'package:wordy/data/network/request/register_user_request.dart';
import 'package:wordy/data/network/request/update_user_interface_language_request.dart';
import 'package:wordy/domain/models/course.dart';
import 'package:wordy/domain/models/learned_word.dart';

import '../../data/dto/achievement_dto.dart';
import '../../data/dto/achievement_list.dart';

import '../../data/dto/flash_card_list_response.dart';
import '../../data/dto/interface_language_response.dart';
import '../../data/dto/learned_word_list_response.dart';
import '../../data/dto/update_register_status_response.dart';
import '../../data/dto/update_user_current_course_response.dart';
import '../../data/dto/user_response.dart';
import '../../data/dto/word_list_response.dart';
import '../../data/local/local_storage.dart';
import '../../data/network/remote_source.dart';
import '../../data/network/request/login_user_request.dart';
import '../../data/network/request/models/begginer_quiz_request_model.dart';
import '../../data/network/request/models/flash_card_list_request_model.dart';
import '../../data/network/request/models/update_user_interface_language_request_model.dart';
import '../../data/network/request/models/user_settings_request_model.dart';
import '../../data/network/request/models/words_by_topic_request_model.dart';
import '../../data/network/request/update_register_status_request.dart';
import '../../data/network/request/update_user_current_course_request.dart';
import '../../data/network/request/user_settings_request.dart';

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
  Future<Either<DioError, ActiveCourse>> getUserCurrentCourseProgress(
      String userId) async {
    var course = await _remoteSource.getUserCurrentCourseProgress(userId);
    if (course.isRight) {
      return Either.right(course.right!.toDomain());
    } else {
      return Either.left(course.left);
    }
  }

  Future<Either<DioError, List<Course>>> getAvailableCourses(
      String userId) async {
    var courses = await _remoteSource.getAvailableCourses(userId);
    if (courses.isRight) {
      return Either.right(
          courses.right!.courses.map((e) => e.toDomain()).toList());
    } else {
      return Either.left(courses.left);
    }
  }

  Future<Either<DioError, UserActiveCoursesProgress>>
      getUserActiveCoursesProgress(String userId) async {
    var response = await _remoteSource.getUserActiveCoursesProgress(userId);

    if (response.isRight) {
      return Either.right(response.right!.toDomain());
    } else {
      return Either.left(response.left);
    }
  }

  Future<Either<DioError, String>> switchInterfaceLangauge(
      UpdateUserInterfaceLanguageModel model) async {
    var response = await _remoteSource.switchInterfaceLanguage(
        UpdateUserInterfaceLanguageRequest.fromJson(model.toMap()));
    if (response.isRight) {
      return Either.right(response.right!.message);
    } else {
      return Either.left(response.left);
    }
  }

  Future<Either<DioError, RegisterationStatus>> getRegisterationStatus(
      String userId) async {
    var response = await _remoteSource.getRegisterationStatus(userId);

    if (response.isRight) {
      return Either.right(response.right!.toDomain());
    } else {
      return Either.left(response.left);
    }
  }

  Future<Either<DioError, UserSettings>> getUserSettings(
      UserSettingsRequestModel request) async {
    var response = await _remoteSource
        .getUserSettings(UserSettingsRequest.fromJson(request.toJson()));
    if (response.isRight) {
      return Either.right(response.right!.toDomain());
    } else {
      return Either.left(response.left);
    }
  }

  Future<Either<DioError, String>> insertLearnedWordList(model) async {
    var response = await _remoteSource.insertLearnedWordList(model);
    if (response.isRight) {
      return Either.right('Success');
    } else {
      return Either.left(response.left);
    }
  }

  Future<Either<DioError, List<LearnedWord>>> getLearnedWordList(
      String userId) async {
    var response = await _remoteSource.getLearnedWordList(userId);
    if (response.isRight) {
      return Either.right(
          response.right!.learnedWords.map((e) => e.toDomain()).toList());
    } else {
      return Either.left(response.left);
    }
  }

  Future<Either<DioError, List<BeginnerQuizQuestion>>> getBeginnerQuizWordList(
      BeginnerQuizModel request) async {
    var response = await _remoteSource.getBeginnerQuizWordList(request);
    if (response.isRight) {
      return Either.right(response.right!.beginnerQuizWordList
          .map((e) => e.toDomain())
          .toList());
    } else {
      return Either.left(response.left);
    }
  }

  Future<Either<DioError, List<FlashCardData>>> createFlashCardList(
      FlashCardListModel request) async {
    var response = await _remoteSource.createFlashCardList(request);
    if (response.isRight) {
      return Either.right(
          response.right!.wordList.map((e) => e.toDomain()).toList());
    } else {
      return Either.left(response.left);
    }
  }

  Future<Either<DioError, UserCourse>> updateUserCurrentCourse(
      UpdateUserCurrentCourseRequest request) async {
    var response = await _remoteSource.switchCurrentCourse(request);
    if (response.isRight) {
      return Either.right(response.right!.updatedCourse.toDomain());
    } else {
      return Either.left(response.left);
    }
  }

  Future<Either<DioError, UserCourse>> getUserCurrentCourse(
      String userId) async {
    var response = await _remoteSource.getUserCurrentCourse(userId);
    if (response.isRight) {
      return Either.right(response.right!.toDomain());
    } else {
      return Either.left(response.left);
    }
  }

  Future<Either<DioError, bool>> updateUserRegisterStatus(
      UpdateRegisterStatusRequest request) async {
    var response = await _remoteSource.updateRegisterationStatus(request);
    if (response.isRight) {
      return Either.right(response.right!.updatedRegisterStatus);
    } else {
      return Either.left(response.left);
    }
  }

  Future<Either<DioError, List<InterfaceLanguage>>>
      getAvailableLanguages() async {
    var response = await _remoteSource.getAvailableLanguages();
    if (response.isRight) {
      return Either.right(
          response.right!.languages.map((e) => e.toDomain()).toList());
    } else {
      return Either.left(response.left);
    }
  }

  Future<Either<DioError, String>> loginUser(LoginUserRequest request) async {
    var response = await _remoteSource.loginUser(request);
    if (response.isRight) {
      return Either.right(response.right!.user.id);
    } else {
      return Either.left(response.left);
    }
  }

  Future<Either<DioError, String>> registerUser(
      RegisterUserRequest request) async {
    var response = await _remoteSource.registerUser(request);
    if (response.isRight) {
      return Either.right(response.right!.message);
    } else {
      return Either.left(response.left);
    }
  }

  Future<Either<DioError, Achievement>> getAchievementById(int id) async {
    var response = await _remoteSource.getAchievementById(id);
    if (response.isRight) {
      return Either.right(response.right!.toDomain());
    } else {
      return Either.left(response.left);
    }
  }

  Future<Either<DioError, List<Achievement>>> getAllAchievements() async {
    var response = await _remoteSource.getAllAchievements();
    if (response.isRight) {
      return Either.right(
          response.right!.achievements.map((e) => e.toDomain()).toList());
    } else {
      return Either.left(response.left);
    }
  }

  Future<Either<DioError, List<Achievement>>> getUserAchievements(
      int userID) async {
    var response = await _remoteSource.getUserAchievements(userID);
    if (response.isRight) {
      return Either.right(
          response.right!.achievements.map((e) => e.toDomain()).toList());
    } else {
      return Either.left(response.left);
    }
  }

  Future<Either<DioError, List<Word>>> getAllLearnedWords(int userID) async {
    var response = await _remoteSource.getAllLearnedWords(userID);
    if (response.isRight) {
      return Either.right(
          response.right!.wordList.map((e) => e.toDomain()).toList());
    } else {
      return Either.left(response.left);
    }
  }

  Future<Either<DioError, List<Word>>> getAllWords() async {
    var response = await _remoteSource.getAllWords();
    if (response.isRight) {
      return Either.right(
          response.right!.wordList.map((e) => e.toDomain()).toList());
    } else {
      return Either.left(response.left);
    }
  }

  Future<Either<DioError, List<Word>>> getLearnedWordsByTopic(
      String topic, String userID) async {
    var response = await _remoteSource.getLearnedWordsByTopic(topic, userID);
    if (response.isRight) {
      return Either.right(
          response.right!.wordList.map((e) => e.toDomain()).toList());
    } else {
      return Either.left(response.left);
    }
  }

  Future<Either<DioError, List<Word>>> getWordsByTopic(
      WordsByTopicModel request) async {
    var response = await _remoteSource.getWordsByTopic(request);
    if (response.isRight) {
      return Either.right(
          response.right!.wordList.map((e) => e.toDomain()).toList());
    } else {
      return Either.left(response.left);
    }
  }

  Future<Either<Exception, String>> getUserInterfaceLanguage() async {
    var response = await _localSource.getUserInterfaceLanguage();

    if (response != null) {
      return Either.right(response);
    } else {
      return Either.left(Exception('User didnt set interface language'));
    }
  }

  Future<Either<Exception, String>> synchronizeUserInterfaceLanguage() async {
    final userId = await _localSource.getUserId();
    if (userId != null) {
      var response = await _remoteSource
          .getUserSettings(UserSettingsRequest(userId: userId));

      if (response.isRight) {
        await _localSource
            .setUserInterfaceLanguage(response.right!.interfaceLanguage.name);
      } else {
        return Either.left(
            Exception('Error occured while synchronizing with server'));
      }
    }
    return Either.right("Unknown error when synchronizing with server");
  }

  Future<Either<Exception, String>> getUserId() async {
    var response = await _localSource.getUserId();
    if (response != null) {
      return Either.right(response);
    } else {
      return Either.left(Exception('Local storage error'));
    }
  }

  void setUserId(String id) async {
    _localSource.setUserId(id);
  }

  Future<Either<DioError, bool>> cancelRequest() async {
    var response = await _remoteSource.cancelRequest();

    if (response.isRight) {
      return Either.left(response.left);
    } else {
      return Either.right(response.right);
    }
  }
}
