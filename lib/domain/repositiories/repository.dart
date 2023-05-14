import '../../data/dto/achievement_dto.dart';
import '../../data/dto/achievement_list.dart';
import '../../data/dto/word_list_response.dart';
import '../../data/network/api_response.dart';
import '../../data/network/remote_source.dart';
import '../models/user.dart';

class Repository {
  final RemoteSource _remoteSource = RemoteSource();
  Future<ApiResponse<String>> loginUser(User user) async {
    return await _remoteSource.loginUser(user.toDto());
  }

  Future<ApiResponse> registerUser(User user) async {
    return await _remoteSource.registerUser(user.toDto());
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
