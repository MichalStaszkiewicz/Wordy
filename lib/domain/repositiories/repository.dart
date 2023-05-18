import 'package:wordy/data/dto/language_list_response.dart';

import '../../data/dto/achievement_dto.dart';
import '../../data/dto/achievement_list.dart';

import '../../data/dto/language_dto.dart';
import '../../data/dto/user_data_response_dto.dart';
import '../../data/dto/word_list_response.dart';
import '../../data/network/api_response.dart';
import '../../data/network/remote_source.dart';
import '../models/user.dart';

class Repository {
  final RemoteSource _remoteSource = RemoteSource();
  Future<ApiResponse<UserDataResponseDto>> getUserData(String userId) async {
    return await _remoteSource.getUserData(userId);
  }

  Future<ApiResponse<LanguageDto>> getUserInterfaceLanguage(
      String userId) async {
    return await _remoteSource.getUserInterfaceLanguage(userId);
  }

  Future<ApiResponse<LanguageListResponse>> getAvailableLanguages() async {
    return await _remoteSource.getAvailableLanguages();
  }

  Future<ApiResponse<String>> loginUser(
      Map<String, dynamic> userAuthData) async {
    return await _remoteSource.loginUser(userAuthData);
  }

  Future<ApiResponse> registerationStatus(String userId) async {
    return await _remoteSource.registerationStatus(userId);
  }

  Future<ApiResponse> registerUser(Map<String, dynamic> userAuthData) async {
    return await _remoteSource.registerUser(userAuthData);
  }

  Future<AchievementDto> getAchievementById(int id) async {
    return await _remoteSource.getAchievementById(id);
  }

  Future<AchievementListResponse> getAllAchievements() async {
    return await _remoteSource.getAllAchievements();
  }

  Future<AchievementListResponse> getUserAchievements(int userID) async {
    return await _remoteSource.getUserAchievements(userID);
  }

  Future<WordListResponse> getAllLearnedWords(int userID) async {
    return await _remoteSource.getAllLearnedWords(userID);
  }

  Future<WordListResponse> getAllWords() async {
    return await _remoteSource.getAllWords();
  }

  Future<WordListResponse> getLearnedWordsByTopic(
      String topic, int userID) async {
    return await _remoteSource.getLearnedWordsByTopic(topic, userID);
  }

  Future<WordListResponse?> getWordsByTopic(String topic) async {
    return await _remoteSource.getWordsByTopic({topic: topic});
  }
}
