import 'package:dio/dio.dart';
import 'package:wordy/data/dto/achievement_list.dart';
import 'package:wordy/domain/models/user.dart';

import '../../data/dto/achievement_dto.dart';
import '../../data/dto/user_dto.dart';
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
  Future<ApiResponse> registerUser(UserDto user);
  Future<ApiResponse<String>> loginUser(UserDto user);

  //Future<int> getWordiesCountByTopic(String topic);
}
