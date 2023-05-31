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
import '../../data/network/remote_source.dart';
import '../../data/network/request/login_user_request.dart';
import '../../data/network/request/models/begginer_quiz_request_model.dart';
import '../../data/network/request/models/flash_card_list_request_model.dart';
import '../../data/network/request/models/user_settings_request_model.dart';
import '../../data/network/request/models/words_by_topic_request_model.dart';
import '../../data/network/request/update_register_status_request.dart';
import '../../data/network/request/update_user_current_course_request.dart';
import '../../data/network/request/user_settings_request.dart';
import '../models/course.dart';
import '../models/learned_word.dart';
import '../models/registeration_status.dart';
import '../models/user.dart';
import '../models/user_settings.dart';

class Repository {
  final RemoteSource _remoteSource = RemoteSource();
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
    return await _remoteSource.getBeginerQuizWordList(request);
  }

  Future<FlashCardListResponse> createFlashCardList(
      FlashCardListModel request) async {
    return await _remoteSource.createFlashCardList(request);
  }

  Future<Course> updateUserCurrentCourse(
      UpdateUserCurrentCourseRequest request) async {
    return await _remoteSource
        .updateUserCurrentCourse(request)
        .then((value) => value.updatedCourse.toDomain());
  }

  Future<UpdateRegisterStatusResponse> updateUserRegisterStatus(
      UpdateRegisterStatusRequest request) async {
    return await _remoteSource.updateRegisterStatus(request);
  }

  Future<UpdateUserInterfaceLanguageResponse> updateUserInterfaceLanguage(
      UpdateUserInterfaceLanguageRequest request) async {
    return await _remoteSource.updateUserInterfaceLanguage(request);
  }

  Future<UserResponse> getUserData(String userId) async {
    return await _remoteSource.getUserData(userId);
  }

  Future<InterfaceLanguageResponse> getUserInterfaceLanguage(
      String userId) async {
    return await _remoteSource.getUserInterfaceLanguage(userId);
  }

  Future<LanguageListResponse> getAvailableLanguages() async {
    return await _remoteSource.getAvailableLanguages();
  }

  Future<LoginUserResponse> loginUser(LoginUserRequest request) async {
    return await _remoteSource.loginUser(request);
  }

  Future<RegisterationStatus> registerationStatus(String userId) async {
    return await _remoteSource
        .registerationStatus(userId)
        .then((value) => value.toDomain());
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
