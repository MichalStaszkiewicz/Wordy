import 'dart:ffi';

import 'package:dio/dio.dart';

import 'package:wordy/data/network/api_service.dart';
import 'package:wordy/data/network/request/login_user_request.dart';

import 'package:wordy/data/network/request/register_user_request.dart';
import 'package:wordy/data/network/response/course_list_response.dart';
import 'package:wordy/data/network/response/flash_card_list_response.dart';
import 'package:wordy/data/network/response/language_list_response.dart';
import 'package:wordy/data/network/response/known_word_list.dart';
import 'package:wordy/data/network/response/login_user_response.dart';
import 'package:wordy/data/network/response/refresh_token_response.dart';
import 'package:wordy/data/network/response/register_user_response.dart';
import 'package:wordy/data/network/response/registeration_response.dart';
import 'package:wordy/data/network/response/topic_list_response.dart';
import 'package:wordy/data/network/response/update_registeration_status_response.dart';
import 'package:wordy/data/network/response/update_user_current_course_response.dart';
import 'package:wordy/data/network/response/update_user_interface_language_response.dart';

import 'package:wordy/domain/repositiories/server_interface.dart';

import '../../domain/models/active_course.dart';
import '../../domain/models/profile_data.dart';
import '../../domain/models/user_active_courses_progress.dart';
import '../../domain/models/user_course.dart';
import '../../domain/models/user_settings.dart';
import '../../utility/either.dart';

class RemoteSource implements ServerInterface {
  RemoteSource(this._apiService);
  final ApiService _apiService;

  @override
  Future<Either<DioError, KnownWordList>> getLearnedWordsByTopic(
    String topic,
    String token,
  ) async {
    try {
      var response = await _apiService.get('/v1/knownWords/get/by/topic/$topic',
          options: Options(headers: {'authorization': token}));

      return Either.data(KnownWordList.fromJson(response.data));
    } on DioError catch (exception) {
      return Either.error(exception);
    }
  }

  @override
  Future<Either<DioError, KnownWordList>> getWordsByTopic(String topic) async {
    try {
      var response = await _apiService.get(
        'v1/words/$topic',
      );

      return Either.data(KnownWordList.fromJson(response.data));
    } on DioError catch (exception) {
      return Either.error(exception);
    }
  }

  @override
  Future<Either<DioError, LoginUserResponse>> loginUser(
      LoginUserRequest request) async {
    try {
      var response =
          await _apiService.post('/v1/user/login', payload: request.toJson());

      return Either.data(LoginUserResponse.fromJson(response.data));
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
      String topic, String token) async {
    try {
      var response = await _apiService.get(
        '/v1/words/flashCards/by/topic/${topic.toLowerCase()}',
        options: Options(headers: {'authorization': token}),
      );
      return Either.data(FlashCardListResponse.fromJson(response.data));
    } on DioError catch (exception) {
      return Either.error(exception);
    }
  }

  @override
  Future<Either<DioError, FlashCardListResponse>> getBeginnerQuizWordList(
      String topic, String token) async {
    try {
      var response = await _apiService.get('/v1/words/flashCards/$topic',
          options: Options(headers: {'authorization': token}));
      return Either.data(FlashCardListResponse.fromJson(response.data));
    } on DioError catch (exception) {
      return Either.error(exception);
    }
  }

  @override
  Future<Either<DioError, KnownWordList>> getLearnedWordList(
      String token) async {
    try {
      var response = await _apiService.get('/v1/user/knownWords/get',
          options: Options(headers: {'authorization': token}));
      print(response.data);
      return Either.data(KnownWordList.fromJson(response.data));
    } on DioError catch (exception) {
      return Either.error(exception);
    }
  }

  @override
  Future<Either<DioError, void>> insertLearnedWordList(
      List<int> wordIdList, String token) async {
    try {
      await _apiService.post("/v1/user/knownWords/insert",
          options: Options(headers: {'authorization': token}),
          payload: {'wordIdList': wordIdList});
      return Either.data(null);
    } on DioError catch (exception) {
      return Either.error(exception);
    }
  }

  @override
  Future<Either<DioError, UserSettings>> getUserSettings(String token) async {
    try {
      var response = await _apiService.get('/v1/user/settings/get',
          options: Options(headers: {'authorization': token}));
      return Either.data(UserSettings.fromJson(response.data['userSettings']));
    } on DioError catch (exception) {
      return Either.error(exception);
    }
  }

  @override
  Future<Either<DioError, UserCourse>> getUserCurrentCourse(
      String token) async {
    try {
      var response = await _apiService.get('/v1/profile/course',
          options: Options(headers: {'authorization': token}));
      return Either.data(UserCourse.fromJson(response.data['userCourse']));
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
  Future<Either<DioError, UserActiveCoursesProgress>>
      getUserActiveCoursesProgress(String token) async {
    try {
      var response = await _apiService.get('/v1/user/course/progress',
          options: Options(headers: {'authorization': token}));

      return Either.data(UserActiveCoursesProgress.fromJson(response.data));
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
  Future<Either<DioError, ActiveCourse>> getUserCurrentCourseProgress(
      String token) async {
    try {
      var response = await _apiService.get('/v1/user/course/current/progress',
          options: Options(headers: {'authorization': token}));

      return Either.data(ActiveCourse.fromJson(response.data[0]));
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

  @override
  Future<Either<DioError, RefreshTokenResponse>> refreshToken(
      String refreshToken) async {
    try {
      var response = await _apiService
          .post('/v1/refreshToken', payload: {'token': refreshToken});

      return Either.data(RefreshTokenResponse.fromJson(response.data));
    } on DioError catch (e) {
      return Either.error(e);
    }
  }

  @override
  Future<Either<DioError, String>> recoverAccount(String email) async {
    try {
      var response =
          await _apiService.post('/v1/user/recover', payload: {'email': email});

      return Either.data('');
    } on DioError catch (e) {
      return Either.error(e);
    }
  }

  @override
  Future<Either<DioError, String>> updateUserPassword(
      String email, String password) async {
    try {
      var response = await _apiService.post('/v1/user/updateUserPassword',
          payload: {'email': email, 'newPassword': password});

      return Either.data(response.data['message']);
    } on DioError catch (e) {
      return Either.error(e);
    }
  }

  @override
  Future<Either<DioError, String>> validateResetPassword(
      String email, String resetPasswordToken) async {
    try {
      var response = await _apiService.post('/v1/user/validateResetPassword',
          payload: {'email': email, 'token': resetPasswordToken});

      return Either.data(response.data['message']);
    } on DioError catch (e) {
      return Either.error(e);
    }
  }

  @override
  Future<Either<DioError, TopicListResponse>> getTopics() async {
    try {
      var response = await _apiService.get(
        '/v1/topic/',
      );

      return Either.data(TopicListResponse.fromJson(response.data));
    } on DioError catch (e) {
      return Either.error(e);
    }
  }
}
