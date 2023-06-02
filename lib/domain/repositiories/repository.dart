import 'dart:ffi';

import 'package:wordy/const/shared_preferences_keys.dart';
import 'package:wordy/data/dto/beginner_quiz_word_list_response.dart';
import 'package:wordy/data/dto/language_list_response.dart';
import 'package:wordy/data/dto/login_user_response.dart';
import 'package:wordy/data/dto/register_user_response.dart';
import 'package:wordy/data/dto/update_user_interface_language_response.dart';
import 'package:wordy/data/network/request/models/insert_learned_words.request.model.dart';
import 'package:wordy/data/network/request/register_user_request.dart';
import 'package:wordy/data/network/request/update_user_interface_language_request.dart';

import '../../data/dto/achievement_dto.dart';
import '../../data/dto/achievement_list.dart';

import '../../data/dto/flash_card_list_response.dart';
import '../../data/dto/interface_language_response.dart';
import '../../data/dto/learned_word_list_response.dart';
import '../../data/dto/update_register_status_response.dart';
import '../../data/dto/update_user_current_course_response.dart';
import '../../data/dto/user_response.dart';
import '../../data/dto/word_list_response.dart';
import '../../data/local/local_storage.dart';
import '../../data/network/remote_source.dart';
import '../../data/network/request/login_user_request.dart';
import '../../data/network/request/models/begginer_quiz_request_model.dart';
import '../../data/network/request/models/flash_card_list_request_model.dart';
import '../../data/network/request/models/update_user_interface_language_request_model.dart';
import '../../data/network/request/models/user_settings_request_model.dart';
import '../../data/network/request/models/words_by_topic_request_model.dart';
import '../../data/network/request/update_register_status_request.dart';
import '../../data/network/request/update_user_current_course_request.dart';
import '../../data/network/request/user_settings_request.dart';

import '../models/registeration_status.dart';

import '../models/user_course.dart';
import '../models/user_settings.dart';

class Repository {
  Repository(
    this._localSource,
    this._remoteSource,
  );
  final LocalStorage _localSource;
  final RemoteSource _remoteSource;
  Future<String> switchInterfaceLangauge(
      UpdateUserInterfaceLanguageModel model) async {
    return await _remoteSource
        .switchInterfaceLanguage(
            UpdateUserInterfaceLanguageRequest.fromJson(model.toMap()))
        .then((value) => value.message);
  }

  Future<RegisterationStatus> getRegisterationStatus(String userId) async {
    return await _remoteSource
        .getRegisterationStatus(userId)
        .then((value) => value.toDomain());
  }

  Future<UserSettings> getUserSettings(UserSettingsRequestModel request) async {
    return await _remoteSource
        .getUserSettings(UserSettingsRequest.fromJson(request.toJson()))
        .then((value) => value.toDomain());
  }

  Future<void> insertLearnedWordList(String userId, List<int> wordIds) async {
    return await _remoteSource.insertLearnedWordList(
        InsertLearnedWordsModel(userId: userId, wordIdList: wordIds));
  }

  Future<LearnedWordListResponse> getLearnedWordList(String userId) async {
    return await _remoteSource.getLearnedWordList(userId);
  }

  Future<BeginnerQuizWordListResponse> getBeginnerQuizWordList(
      BeginnerQuizModel request) async {
    return await _remoteSource.getBeginnerQuizWordList(request);
  }

  Future<FlashCardListResponse> createFlashCardList(
      FlashCardListModel request) async {
    return await _remoteSource.createFlashCardList(request);
  }

  Future<UserCourse> updateUserCurrentCourse(
      UpdateUserCurrentCourseRequest request) async {
    return await _remoteSource
        .switchCurrentCourse(request)
        .then((value) => value.updatedCourse.toDomain());
  }

  Future<UserCourse> getUserCurrentCourse(String userId) async {
    return await _remoteSource
        .getUserCurrentCourse(userId)
        .then((value) => value.userCourse.toDomain());
  }

  Future<UpdateRegisterationStatusResponse> updateUserRegisterStatus(
      UpdateRegisterStatusRequest request) async {
    return await _remoteSource.updateRegisterationStatus(request);
  }

  Future<LanguageListResponse> getAvailableLanguages() async {
    return await _remoteSource.getAvailableLanguages();
  }

  Future<LoginUserResponse> loginUser(LoginUserRequest request) async {
    return await _remoteSource.loginUser(request);
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

  Future<String?> getUserInterfaceLanguage() async {
    return await _localSource.getUserInterfaceLanguage();
  }

  Future<void> synchronizeUserInterfaceLanguage() async {
    final userId = await _localSource.getUserId();
    if (userId != null) {
      String updatedLangaugeName = await _remoteSource
          .getUserSettings(UserSettingsRequest(userId: userId))
          .then((value) => value.interfaceLanguage.name);

      await _localSource.setUserInterfaceLanguage(updatedLangaugeName);
    }
  }

  Future<String?> getUserId() async {
    return await _localSource.getUserId();
  }

  void setUserId(String id) async {
    _localSource.setUserId(id);
  }
}
