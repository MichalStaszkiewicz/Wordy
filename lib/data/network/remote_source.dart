import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:uuid/uuid.dart';
import 'package:wordy/data/dto/achievement_list.dart';
import 'package:wordy/data/dto/word_list_response.dart';
import 'package:wordy/data/network/api_service.dart';
import 'package:wordy/domain/repositiories/server_interface.dart';
import '../../domain/models/user.dart';
import '../dto/achievement_dto.dart';
import 'api_response.dart';

class RemoteSource implements ServerInterface {
  RemoteSource();
  ApiService _apiService = ApiService(baseUrl: 'http://192.168.55.101:1344');

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
  Future<WordListResponse> getWordsByTopic(Map<String, dynamic> data) async {
    try {
      var response = await _apiService.get('/words/${data['topic']}');

      return WordListResponse.fromJson(response.data);
    } on DioError catch (exception) {
      rethrow;
    }
  }

  @override
  Future<ApiResponse<String>> loginUser(
      Map<String, dynamic> userAuthData) async {
    try {
      var response = await _apiService.get(
          '/v1/user/login/${userAuthData['email']}/${userAuthData['password']}');

      return ApiResponse<String>(
          data: response.data['id']!, message: response.data['message']);
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Future<ApiResponse> registerUser(Map<String, dynamic> userAuthData) async {
    try {
      var response = await _apiService.post(
          '/v1/user/register/${userAuthData['fullName']}/${userAuthData['email']}/${userAuthData['password']}');
      print(response.data);
      final Map<String, dynamic> data = response.data as Map<String, dynamic>;
      return ApiResponse(data: null, message: data['message']);
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Future<ApiResponse<bool>> registerationStatus(String userId) async {
    try {
      var response = await _apiService.get('/v1/user/info/{$userId}');

      final Map<String, dynamic> data = response.data as Map<String, dynamic>;
      return ApiResponse(
          data: data['registrationStatus'] as bool, message: null);
    } on Exception catch (e) {
      rethrow;
    }
  }
}
