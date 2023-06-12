import 'dart:ffi';

import 'package:dio/dio.dart';

import 'package:wordy/data/dto/achievement_list.dart';
import 'package:wordy/data/dto/active_course_response.dart';
import 'package:wordy/data/dto/beginner_quiz_word_list_response.dart';
import 'package:wordy/data/dto/flash_card_list_response.dart';
import 'package:wordy/data/dto/language_list_response.dart';
import 'package:wordy/data/dto/learned_word_list_response.dart';
import 'package:wordy/data/dto/profile_data.dart';
import 'package:wordy/data/dto/register_user_response.dart';
import 'package:wordy/data/dto/update_register_status_response.dart';
import 'package:wordy/data/dto/update_user_current_course_response.dart';
import 'package:wordy/data/dto/update_user_interface_language_response.dart';
import 'package:wordy/data/dto/user_active_courses_progress_response.dart';
import 'package:wordy/data/dto/user_settings_response.dart';
import 'package:wordy/data/dto/word_list_response.dart';
import 'package:wordy/data/network/api_service.dart';
import 'package:wordy/data/network/request/login_user_request.dart';

import 'package:wordy/data/network/request/register_user_request.dart';

import 'package:wordy/domain/repositiories/server_interface.dart';

import '../../utility/either.dart';
import '../dto/achievement_dto.dart';
import '../dto/login_user_response.dart';

import '../dto/registeration_response.dart';
import '../dto/user_course_response.dart';
import '../../data/dto/course_list_response.dart';

class RemoteSource implements ServerInterface {
  RemoteSource(this._apiService);
  final ApiService _apiService;

  @override
  Future<Either<DioError, WordListResponse>> getLearnedWordsByTopic(
    String topic,
    String token,
  ) async {
    try {
      var response = await _apiService.get(
          '/v1/learnedWords/get/by/topic/$topic',
          options: Options(headers: {'authorization': token}));

      return Either.data(WordListResponse.fromJson(response.data));
    } on DioError catch (exception) {
      return Either.error(exception);
    }
  }

  @override
  Future<Either<DioError, WordListResponse>> getWordsByTopic(
      String topic) async {
    try {
      var response = await _apiService.get(
        'v1/words/$topic',
      );

      return Either.data(WordListResponse.fromJson(response.data));
    } on DioError catch (exception) {
      return Either.error(exception);
    }
  }

  @override
  Future<Either<DioError, LoginResponse>> loginUser(
      LoginUserRequest request) async {
    try {
      var response =
          await _apiService.post('/v1/user/login', payload: request.toJson());

      return Either.data(LoginResponse.fromJson(response.data));
    } on DioError catch (exception) {
      return Either.error(exception);
    }
  }

  @override
  Future<Either<DioError, RegisterUserResponse>> registerUser(
      RegisterUserRequest request) async {
    try {
      var response = await _apiService.post('/v1/user/register',
          payload: request.toJson());

      return Either.data(RegisterUserResponse.fromJson(response.data));
    } on DioError catch (exception) {
      return Either.error(exception);
    }
  }

  @override
  Future<Either<DioError, RegisterationResponse>> getRegisterationStatus(
      String token) async {
    try {
      var response = await _apiService.get('/v1/user/info/registerStatus',
          options: Options(headers: {'authorization': token}));

      return Either.data(RegisterationResponse.fromJson(response.data));
    } on DioError catch (exception) {
      return Either.error(exception);
    }
  }

  @override
  Future<Either<DioError, LanguageListResponse>> getAvailableLanguages() async {
    try {
      var response = await _apiService.get('/v1/languages');
      return Either.data(LanguageListResponse.fromJson(response.data));
    } on DioError catch (exception) {
      return Either.error(exception);
    }
  }

  @override
  Future<Either<DioError, UpdateUserInterfaceLanguageResponse>>
      switchInterfaceLanguage(String token, String languageName) async {
    try {
      var response = await _apiService.put('/v1/user/update/language',
          payload: {"languageName": languageName},
          options: Options(headers: {'authorization': token}));
      return Either.data(
          UpdateUserInterfaceLanguageResponse.fromJson(response.data));
    } on DioError catch (exception) {
      return Either.error(exception);
    }
  }

  @override
  Future<Either<DioError, UpdateRegisterationStatusResponse>>
      updateRegisterationStatus(String token) async {
    try {
      var response = await _apiService.put('/v1/user/update/registerStatus',
          options: Options(headers: {'authorization': token}));
      return Either.data(
          UpdateRegisterationStatusResponse.fromJson(response.data));
    } on DioError catch (exception) {
      return Either.error(exception);
    }
  }

  @override
  Future<Either<DioError, UpdateUserCurrentCourseResponse>> switchCurrentCourse(
      String courseName, String token) async {
    try {
      var response = await _apiService.put('/v1/user/update/currentCourse',
          options: Options(headers: {'authorization': token}),
          payload: {"courseName": courseName});
      return Either.data(
          UpdateUserCurrentCourseResponse.fromJson(response.data));
    } on DioError catch (exception) {
      return Either.error(exception);
    }
  }

  @override
  Future<Either<DioError, FlashCardListResponse>> createFlashCardList(
      String topic) async {
    try {
      var response =
          await _apiService.get('/v1/words/flashCards/by/topic/$topic');
      return Either.data(FlashCardListResponse.fromJson(response.data));
    } on DioError catch (exception) {
      return Either.error(exception);
    }
  }

  @override
  Future<Either<DioError, BeginnerQuizWordListResponse>>
      getBeginnerQuizWordList(String topic, String token) async {
    try {
      var response = await _apiService.get('/v1/words/flashCards/$topic',
          options: Options(headers: {'authorization': token}));
      return Either.data(BeginnerQuizWordListResponse.fromJson(response.data));
    } on DioError catch (exception) {
      return Either.error(exception);
    }
  }

  @override
  Future<Either<DioError, LearnedWordListResponse>> getLearnedWordList(
      String token) async {
    try {
      var response = await _apiService.get('/v1/user/learnedWords/get',
          options: Options(headers: {'authorization': token}));
      print(response.data);
      return Either.data(LearnedWordListResponse.fromJson(response.data));
    } on DioError catch (exception) {
      return Either.error(exception);
    }
  }

  @override
  Future<Either<DioError, void>> insertLearnedWordList(
      List<int> wordIdList, String token) async {
    try {
      await _apiService.post("/v1/user/learnedWords/insert",
          options: Options(headers: {'authorization': token}),
          payload: {'wordIdList': wordIdList});
      return Either.data(null);
    } on DioError catch (exception) {
      return Either.error(exception);
    }
  }

  @override
  Future<Either<DioError, UserSettingsResponse>> getUserSettings(
      String token) async {
    try {
      var response = await _apiService.get('/v1/user/settings/get',
          options: Options(headers: {'authorization': token}));
      return Either.data(
          UserSettingsResponse.fromJson(response.data['userSettings']));
    } on DioError catch (exception) {
      return Either.error(exception);
    }
  }

  @override
  Future<Either<DioError, UserCourseResponse>> getUserCurrentCourse(
      String token) async {
    try {
      var response = await _apiService.get('/v1/profile/course',
          options: Options(headers: {'authorization': token}));
      return Either.data(
          UserCourseResponse.fromJson(response.data['userCourse']));
    } on DioError catch (exception) {
      return Either.error(exception);
    }
  }

  @override
  Future<Either<DioError, bool>> cancelRequest() async {
    try {
      await _apiService.cancelRequests();
      return Either.data(true);
    } on DioError catch (exception) {
      return Either.error(exception);
    }
  }

  @override
  Future<Either<DioError, UserActiveCoursesProgressResponse>>
      getUserActiveCoursesProgress(String token) async {
    try {
      var response = await _apiService.get('/v1/user/course/progress',
          options: Options(headers: {'authorization': token}));

      return Either.data(
          UserActiveCoursesProgressResponse.fromJson(response.data));
    } on DioError catch (e) {
      return Either.error(e);
    }
  }

  @override
  Future<Either<DioError, CourseListResponse>> getAvailableCourses(
      String token) async {
    try {
      var response = await _apiService.get('/v1/user/course/availableCourses',
          options: Options(headers: {'authorization': token}));

      return Either.data(CourseListResponse.fromJson(response.data));
    } on DioError catch (e) {
      return Either.error(e);
    }
  }

  @override
  Future<Either<DioError, ActiveCourseResponse>> getUserCurrentCourseProgress(
      String token) async {
    try {
      var response = await _apiService.get('/v1/user/course/current/progress',
          options: Options(headers: {'authorization': token}));

      return Either.data(ActiveCourseResponse.fromJson(response.data[0]));
    } on DioError catch (e) {
      return Either.error(e);
    }
  }

  @override
  Future<Either<DioError, ProfileData>> getProfileData(String token) async {
    try {
      var response = await _apiService.get('/v1/profile/data',
          options: Options(headers: {'authorization': token}));

      return Either.data(ProfileData.fromJson(response.data));
    } on DioError catch (e) {
      return Either.error(e);
    }
  }
}
