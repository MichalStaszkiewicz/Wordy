import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:wordy/const/urls.dart';

import 'package:wordy/data/dto/achievement_list.dart';
import 'package:wordy/data/dto/begginer_quiz_word_list_response.dart';
import 'package:wordy/data/dto/flash_card_list_response.dart';
import 'package:wordy/data/dto/language_response.dart';
import 'package:wordy/data/dto/language_list_response.dart';
import 'package:wordy/data/dto/register_user_response.dart';
import 'package:wordy/data/dto/update_register_status_response.dart';
import 'package:wordy/data/dto/update_user_current_course_response.dart';
import 'package:wordy/data/dto/update_user_interface_language_response.dart';
import 'package:wordy/data/dto/word_list_response.dart';
import 'package:wordy/data/network/api_service.dart';
import 'package:wordy/data/network/request/login_user_request.dart';
import 'package:wordy/data/network/request/models/begginer_quiz_request_model.dart';
import 'package:wordy/data/network/request/models/flash_card_list_request_model.dart';
import 'package:wordy/data/network/request/models/words_by_topic_request_model.dart';
import 'package:wordy/data/network/request/register_user_request.dart';
import 'package:wordy/data/network/request/update_register_status_request.dart';
import 'package:wordy/data/network/request/update_user_current_course_request.dart';
import 'package:wordy/data/network/request/update_user_interface_language_request.dart';
import 'package:wordy/domain/repositiories/server_interface.dart';

import '../dto/achievement_dto.dart';
import '../dto/login_user_response.dart';

import '../dto/register_status_response.dart';
import '../dto/user_data_response.dart';

class RemoteSource implements ServerInterface {
  RemoteSource();
  ApiService _apiService = ApiService(baseUrl: Urls.kBaseUrl);

  @override
  Future<AchievementDto> getAchievementById(int id) async {
    try {
      Response response = await _apiService.get('/achievements');
      return AchievementDto.fromJson(response.data);
    } on Exception catch (exception) {
      rethrow;
    }
  }

  @override
  Future<AchievementListResponse> getAllAchievements() async {
    try {
      Response response = await _apiService.get('/achievements');
      return AchievementListResponse.fromJson(response.data);
    } on Exception catch (exception) {
      rethrow;
    }
  }

  @override
  Future<AchievementListResponse> getUserAchievements(int userID) async {
    try {
      Response response = await _apiService.get('/achievements/');
      return AchievementListResponse.fromJson(response.data);
    } on Exception catch (exception) {
      rethrow;
    }
  }

  @override
  Future<WordListResponse> getAllLearnedWords(int userID) async {
    try {
      var response = await _apiService.get('/learnedWords');
      return WordListResponse.fromJson(response.data);
    } on Exception catch (exception) {
      rethrow;
    }
  }

  @override
  Future<WordListResponse> getAllWords() async {
    try {
      var response = await _apiService.get('/words');

      return WordListResponse.fromJson(response.data);
    } on Exception catch (exception) {
      rethrow;
    }
  }

  @override
  Future<WordListResponse> getLearnedWordsByTopic(
      String topic, int userID) async {
    try {
      var response = await _apiService.get('/learnedWords/byTopic');

      return WordListResponse.fromJson(response.data);
    } on DioError catch (exception) {
      rethrow;
    }
  }

  @override
  Future<WordListResponse> getWordsByTopic(WordsByTopicModel request) async {
    try {
      var response = await _apiService.get('v1/words/${request.topic}');

      return WordListResponse.fromJson(response.data);
    } on DioError catch (exception) {
      rethrow;
    }
  }

  @override
  Future<LoginUserResponse> loginUser(LoginUserRequest request) async {
    try {
      var response =
          await _apiService.post('/v1/user/login', payload: request.toJson());

      return LoginUserResponse.fromJson(response.data);
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Future<RegisterUserResponse> registerUser(RegisterUserRequest request) async {
    try {
      var response = await _apiService.post('/v1/user/register',
          payload: request.toJson());

      return RegisterUserResponse.fromJson(response.data);
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Future<RegisterStatusResponse> registerationStatus(String userId) async {
    try {
      var response =
          await _apiService.get('/v1/user/info/{$userId}/registerStatus');

      UserDataResponse userData =
          UserDataResponse.fromJson(response.data['user']);

      return RegisterStatusResponse.fromJson(response.data);
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Future<LanguageListResponse> getAvailableLanguages() async {
    try {
      var response = await _apiService.get('/v1/languages');
      return LanguageListResponse.fromJson(response.data);
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Future<LanguageResponse> getUserInterfaceLanguage(String userId) async {
    try {
      var response = await _apiService.get('/v1/user/info/{$userId}');
      return LanguageResponse.fromJson(response.data);
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserDataResponse> getUserData(String userId) async {
    try {
      var response = await _apiService.get('/v1/user/info/{$userId}');
      return UserDataResponse.fromJson(response.data['user']);
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Future<UpdateUserInterfaceLanguageResponse> updateUserInterfaceLanguage(
      UpdateUserInterfaceLanguageRequest request) async {
    try {
      var response = await _apiService.put('/v1/user/update/language',
          payload: request.toJson());
      return UpdateUserInterfaceLanguageResponse.fromJson(response.data);
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Future<UpdateRegisterStatusResponse> updateRegisterStatus(
      UpdateRegisterStatusRequest request) async {
    try {
      var response = await _apiService.put('/v1/user/update/registerStatus',
          payload: request.toJson());
      return UpdateRegisterStatusResponse.fromJson(response.data);
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Future<UpdateUserCurrentCourseResponse> updateUserCurrentCourse(
      UpdateUserCurrentCourseRequest request) async {
    try {
      var response = await _apiService.put('/v1/user/update/currentCourse',
          payload: request.toJson());
      return UpdateUserCurrentCourseResponse.fromJson(response.data);
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Future<FlashCardListResponse> createFlashCardList(
      FlashCardListModel request) async {
    try {
      var response = await _apiService.get(
          '/v1/words/flashCards/${request.topic}/${request.interfaceLanguage}/${'polish'}');

      return FlashCardListResponse.fromJson(response.data);
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Future<BegginerQuizWordListResponse> getBegginerQuizWordList(
      BegginerQuizModel request) async {
    try {
      var response = await _apiService.get(
          '/v1/words/quiz/begginer/${request.topic}/${request.interfaceLanguage}/${'polish'}');
      return BegginerQuizWordListResponse.fromJson(response.data);
    } on Exception catch (e) {
      rethrow;
    }
  }
}
