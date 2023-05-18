import 'package:dio/dio.dart';
import 'package:wordy/data/dto/achievement_list.dart';
import 'package:wordy/domain/models/user.dart';

import '../../data/dto/achievement_dto.dart';

import '../../data/dto/language_dto.dart';
import '../../data/dto/language_list_response.dart';
import '../../data/dto/user_data_response_dto.dart';
import '../../data/dto/word_dto.dart';
import '../../data/dto/word_list_response.dart';
import '../../data/network/api_response.dart';

abstract class ServerInterface {
  Future<WordListResponse> getAllWords();
  Future<WordListResponse> getWordsByTopic(Map<String, dynamic> topic);
  Future<WordListResponse> getAllLearnedWords(int userID);
  Future<WordListResponse> getLearnedWordsByTopic(String topic, int userID);
  Future<AchievementListResponse> getAllAchievements();
  Future<AchievementDto> getAchievementById(int id);
  Future<AchievementListResponse> getUserAchievements(int userID);
  Future<ApiResponse> registerUser(Map<String, dynamic> userAuthData);
  Future<ApiResponse<String>> loginUser(Map<String, dynamic> userAuthData);
  Future<ApiResponse<bool>> registerationStatus(String userId);
  Future<ApiResponse<LanguageListResponse>> getAvailableLanguages();
  Future<ApiResponse<LanguageDto>> getUserInterfaceLanguage(String userId);
  Future<ApiResponse<UserDataResponseDto>> getUserData(String userId);

  //Future<int> getWordiesCountByTopic(String topic);
}
