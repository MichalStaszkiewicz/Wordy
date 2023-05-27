import 'package:wordy/data/dto/beginner_quiz_word_list_response.dart';
import 'package:wordy/data/dto/language_list_response.dart';
import 'package:wordy/data/dto/login_user_response.dart';
import 'package:wordy/data/dto/register_status_response.dart';
import 'package:wordy/data/dto/register_user_response.dart';
import 'package:wordy/data/dto/update_user_interface_language_response.dart';
import 'package:wordy/data/network/request/models/insert_learned_words.request.model.dart';
import 'package:wordy/data/network/request/register_user_request.dart';
import 'package:wordy/data/network/request/update_user_interface_language_request.dart';

import '../../data/dto/achievement_dto.dart';
import '../../data/dto/achievement_list.dart';

import '../../data/dto/flash_card_list_response.dart';
import '../../data/dto/language_response.dart';
import '../../data/dto/learned_word_list_response.dart';
import '../../data/dto/update_register_status_response.dart';
import '../../data/dto/update_user_current_course_response.dart';
import '../../data/dto/user_data_response.dart';
import '../../data/dto/word_list_response.dart';
import '../../data/network/remote_source.dart';
import '../../data/network/request/login_user_request.dart';
import '../../data/network/request/models/begginer_quiz_request_model.dart';
import '../../data/network/request/models/flash_card_list_request_model.dart';
import '../../data/network/request/models/words_by_topic_request_model.dart';
import '../../data/network/request/update_register_status_request.dart';
import '../../data/network/request/update_user_current_course_request.dart';
import '../models/learned_word.dart';
import '../models/user.dart';

class Repository {
  final RemoteSource _remoteSource = RemoteSource();
  Future<void> insertLearnedWordList(String userId, List<int> wordIds) async {
    return await _remoteSource.insertLearnedWordList(
        InsertLearnedWordsModel(userId: userId, wordIdList: wordIds));
  }

  Future<LearnedWordListResponse> getLearnedWordList(String userId) async {
    return await _remoteSource.getLearnedWordList(userId);
  }

  Future<BeginnerQuizWordListResponse> getBeginnerQuizWordList(
      BeginnerQuizModel request) async {
    return await _remoteSource.getBeginerQuizWordList(request);
  }

  Future<FlashCardListResponse> createFlashCardList(
      FlashCardListModel request) async {
    return await _remoteSource.createFlashCardList(request);
  }

  Future<UpdateUserCurrentCourseResponse> updateUserCurrentCourse(
      UpdateUserCurrentCourseRequest request) async {
    return await _remoteSource.updateUserCurrentCourse(request);
  }

  Future<UpdateRegisterStatusResponse> updateUserRegisterStatus(
      UpdateRegisterStatusRequest request) async {
    return await _remoteSource.updateRegisterStatus(request);
  }

  Future<UpdateUserInterfaceLanguageResponse> updateUserInterfaceLanguage(
      UpdateUserInterfaceLanguageRequest request) async {
    return await _remoteSource.updateUserInterfaceLanguage(request);
  }

  Future<UserDataResponse> getUserData(String userId) async {
    return await _remoteSource.getUserData(userId);
  }

  Future<LanguageResponse> getUserInterfaceLanguage(String userId) async {
    return await _remoteSource.getUserInterfaceLanguage(userId);
  }

  Future<LanguageListResponse> getAvailableLanguages() async {
    return await _remoteSource.getAvailableLanguages();
  }

  Future<LoginUserResponse> loginUser(LoginUserRequest request) async {
    return await _remoteSource.loginUser(request);
  }

  Future<RegisterStatusResponse> registerationStatus(String userId) async {
    return await _remoteSource.registerationStatus(userId);
  }

  Future<RegisterUserResponse> registerUser(RegisterUserRequest request) async {
    return await _remoteSource.registerUser(request);
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

  Future<WordListResponse?> getWordsByTopic(WordsByTopicModel request) async {
    return await _remoteSource.getWordsByTopic(request);
  }
}
