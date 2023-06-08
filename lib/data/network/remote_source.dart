import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:wordy/const/urls.dart';

import 'package:wordy/data/dto/achievement_list.dart';
import 'package:wordy/data/dto/active_course_response.dart';
import 'package:wordy/data/dto/beginner_quiz_word_list_response.dart';
import 'package:wordy/data/dto/course_response.dart';
import 'package:wordy/data/dto/flash_card_list_response.dart';
import 'package:wordy/data/dto/interface_language_response.dart';
import 'package:wordy/data/dto/language_list_response.dart';
import 'package:wordy/data/dto/learned_word_list_response.dart';
import 'package:wordy/data/dto/register_user_response.dart';
import 'package:wordy/data/dto/update_register_status_response.dart';
import 'package:wordy/data/dto/update_user_current_course_response.dart';
import 'package:wordy/data/dto/update_user_interface_language_response.dart';
import 'package:wordy/data/dto/user_active_courses_progress_response.dart';
import 'package:wordy/data/dto/user_settings_response.dart';
import 'package:wordy/data/dto/word_list_response.dart';
import 'package:wordy/data/network/api_service.dart';
import 'package:wordy/data/network/request/login_user_request.dart';
import 'package:wordy/data/network/request/models/begginer_quiz_request_model.dart';
import 'package:wordy/data/network/request/models/flash_card_list_request_model.dart';
import 'package:wordy/data/network/request/models/insert_learned_words.request.model.dart';
import 'package:wordy/data/network/request/models/words_by_topic_request_model.dart';
import 'package:wordy/data/network/request/register_user_request.dart';
import 'package:wordy/data/network/request/update_register_status_request.dart';
import 'package:wordy/data/network/request/update_user_current_course_request.dart';
import 'package:wordy/data/network/request/update_user_interface_language_request.dart';
import 'package:wordy/data/network/request/user_settings_request.dart';
import 'package:wordy/domain/repositiories/server_interface.dart';

import '../../utility/either.dart';
import '../dto/achievement_dto.dart';
import '../dto/login_user_response.dart';

import '../dto/registeration_response.dart';
import '../dto/user_course_response.dart';
import '../dto/user_response.dart';
import '../../data/dto/course_list_response.dart';

class RemoteSource implements ServerInterface {
  RemoteSource(this._apiService);
  final ApiService _apiService;
  @override
  Future<Either<DioError, AchievementDto>> getAchievementById(int id) async {
    try {
      Response response = await _apiService.get('/achievements');
      return Either.right(AchievementDto.fromJson(response.data));
    } on DioError catch (exception) {
      return Either.left(exception);
    }
  }

  @override
  Future<Either<DioError, AchievementListResponse>> getAllAchievements() async {
    try {
      Response response = await _apiService.get('/achievements');
      return Either.right(AchievementListResponse.fromJson(response.data));
    } on DioError catch (exception) {
      return Either.left(exception);
    }
  }

  @override
  Future<Either<DioError, AchievementListResponse>> getUserAchievements(
      int userID) async {
    try {
      Response response = await _apiService.get('/achievements/');
      return Either.right(AchievementListResponse.fromJson(response.data));
    } on DioError catch (exception) {
      return Either.left(exception);
    }
  }

  @override
  Future<Either<DioError, WordListResponse>> getAllLearnedWords(
      int userID) async {
    try {
      var response = await _apiService.get('/learnedWords');
      return Either.right(WordListResponse.fromJson(response.data));
    } on DioError catch (exception) {
      return Either.left(exception);
    }
  }

  @override
  Future<Either<DioError, WordListResponse>> getAllWords() async {
    try {
      var response = await _apiService.get('/words');

      return Either.right(WordListResponse.fromJson(response.data));
    } on DioError catch (exception) {
      return Either.left(exception);
    }
  }

  @override
  Future<Either<DioError, WordListResponse>> getLearnedWordsByTopic(
      String topic, String userId) async {
    try {
      var response =
          await _apiService.get('/v1/learnedWords/byTopic/${topic}/${userId}');

      return Either.right(WordListResponse.fromJson(response.data));
    } on DioError catch (exception) {
      return Either.left(exception);
    }
  }

  @override
  Future<Either<DioError, WordListResponse>> getWordsByTopic(
      WordsByTopicModel request) async {
    try {
      var response = await _apiService.get('v1/words/${request.topic}');

      return Either.right(WordListResponse.fromJson(response.data));
    } on DioError catch (exception) {
      return Either.left(exception);
    }
  }

  @override
  Future<Either<DioError, LoginUserResponse>> loginUser(
      LoginUserRequest request) async {
    try {
      var response =
          await _apiService.post('/v1/user/login', payload: request.toJson());

      return Either.right(LoginUserResponse.fromJson(response.data));
    } on DioError catch (exception) {
      return Either.left(exception);
    }
  }

  @override
  Future<Either<DioError, RegisterUserResponse>> registerUser(
      RegisterUserRequest request) async {
    try {
      var response = await _apiService.post('/v1/user/register',
          payload: request.toJson());

      return Either.right(RegisterUserResponse.fromJson(response.data));
    } on DioError catch (exception) {
      return Either.left(exception);
    }
  }

  @override
  Future<Either<DioError, RegisterationResponse>> getRegisterationStatus(
      String userId) async {
    try {
      var response =
          await _apiService.get('/v1/user/info/$userId/registerStatus');

      return Either.right(RegisterationResponse.fromJson(response.data));
    } on DioError catch (exception) {
      return Either.left(exception);
    }
  }

  @override
  Future<Either<DioError, LanguageListResponse>> getAvailableLanguages() async {
    try {
      var response = await _apiService.get('/v1/languages');
      return Either.right(LanguageListResponse.fromJson(response.data));
    } on DioError catch (exception) {
      return Either.left(exception);
    }
  }

  @override
  Future<Either<DioError, UpdateUserInterfaceLanguageResponse>>
      switchInterfaceLanguage(
          UpdateUserInterfaceLanguageRequest request) async {
    try {
      var response = await _apiService.put('/v1/user/update/language',
          payload: request.toJson());
      return Either.right(
          UpdateUserInterfaceLanguageResponse.fromJson(response.data));
    } on DioError catch (exception) {
      return Either.left(exception);
    }
  }

  @override
  Future<Either<DioError, UpdateRegisterationStatusResponse>>
      updateRegisterationStatus(UpdateRegisterStatusRequest request) async {
    try {
      var response = await _apiService.put('/v1/user/update/registerStatus',
          payload: request.toJson());
      return Either.right(
          UpdateRegisterationStatusResponse.fromJson(response.data));
    } on DioError catch (exception) {
      return Either.left(exception);
    }
  }

  @override
  Future<Either<DioError, UpdateUserCurrentCourseResponse>> switchCurrentCourse(
      UpdateUserCurrentCourseRequest request) async {
    try {
      var response = await _apiService.put('/v1/user/update/currentCourse',
          payload: request.toJson());
      return Either.right(
          UpdateUserCurrentCourseResponse.fromJson(response.data));
    } on DioError catch (exception) {
      return Either.left(exception);
    }
  }

  @override
  Future<Either<DioError, FlashCardListResponse>> createFlashCardList(
      FlashCardListModel request) async {
    try {
      var response = await _apiService.get(
          '/v1/words/flashCards/by/topic/${request.topic}/${request.userId}');
      return Either.right(FlashCardListResponse.fromJson(response.data));
    } on DioError catch (exception) {
      return Either.left(exception);
    }
  }

  @override
  Future<Either<DioError, BeginnerQuizWordListResponse>>
      getBeginnerQuizWordList(BeginnerQuizModel request) async {
    try {
      var response = await _apiService.get(
        '/v1/words/flashCards/${request.userId}/${request.topic}',
      );
      return Either.right(BeginnerQuizWordListResponse.fromJson(response.data));
    } on DioError catch (exception) {
      return Either.left(exception);
    }
  }

  @override
  Future<Either<DioError, LearnedWordListResponse>> getLearnedWordList(
      String userId) async {
    try {
      var response = await _apiService.get('/v1/user/learnedWords/$userId/get');
      print(response.data);
      return Either.right(LearnedWordListResponse.fromJson(response.data));
    } on DioError catch (exception) {
      return Either.left(exception);
    }
  }

  @override
  Future<Either<DioError, void>> insertLearnedWordList(
      InsertLearnedWordsModel request) async {
    try {
      await _apiService.post("/v1/user/learnedWords/insert",
          payload: request.toMap());
      return Either.right('inserted words');
    } on DioError catch (exception) {
      return Either.left(exception);
    }
  }

  @override
  Future<Either<DioError, UserSettingsResponse>> getUserSettings(
      UserSettingsRequest request) async {
    try {
      var response =
          await _apiService.get('/v1/user/settings/${request.userId}/get');
      return Either.right(
          UserSettingsResponse.fromJson(response.data['userSettings']));
    } on DioError catch (exception) {
      return Either.left(exception);
    }
  }

  @override
  Future<Either<DioError, UserCourseResponse>> getUserCurrentCourse(
      String userId) async {
    try {
      var response = await _apiService.get('/v1/profile/$userId/course');
      return Either.right(
          UserCourseResponse.fromJson(response.data['userCourse']));
    } on DioError catch (exception) {
      return Either.left(exception);
    }
  }

  @override
  Future<Either<DioError, bool>> cancelRequest() async {
    try {
      await _apiService.cancelRequests();
      return Either.right(true);
    } on DioError catch (exception) {
      return Either.left(exception);
    }
  }

  @override
  Future<Either<DioError, UserActiveCoursesProgressResponse>>
      getUserActiveCoursesProgress(String userId) async {
    try {
      var response = await _apiService.get('/v1/user/$userId/course/progress');

      return Either.right(
          UserActiveCoursesProgressResponse.fromJson(response.data));
    } on DioError catch (e) {
      return Either.left(e);
    }
  }

  @override
  Future<Either<DioError, CourseListResponse>> getAvailableCourses(
      String userId) async {
    try {
      var response =
          await _apiService.get('/v1/user/$userId/course/availableCourses');

      return Either.right(CourseListResponse.fromJson(response.data));
    } on DioError catch (e) {
      return Either.left(e);
    }
  }

  @override
  Future<Either<DioError, ActiveCourseResponse>> getUserCurrentCourseProgress(
      String userId) async {
    try {
      var response =
          await _apiService.get('/v1/user/$userId/course/current/progress');

      return Either.right(ActiveCourseResponse.fromJson(response.data[0]));
    } on DioError catch (e) {
      return Either.left(e);
    }
  }
}
