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
import '../dto/user_dto.dart';
import '../dto/word_dto.dart';
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
  Future<ApiResponse<String>> loginUser(UserDto user) async {
    try {
      var response = await _apiService
          .get('/v1/user/login/${user.email}/${user.password}');
      var data = response as Map<String, dynamic>;
      return ApiResponse<String>(data: data['id']!, message: data['message']);
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Future<ApiResponse> registerUser(UserDto user) async {
    try {
      var response = await _apiService.post(
        '/v1/user/register/${user.fullName}/${user.email}/${user.password}'
      );
      print(response.data);
      final Map<String, dynamic> data = response.data as Map<String, dynamic>;
      return ApiResponse(data: null, message: data['message']);
    } on Exception catch (e) {
      rethrow;
    }
  }
}
