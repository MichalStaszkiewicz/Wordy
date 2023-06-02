import 'package:dio/dio.dart';
import 'package:wordy/data/dto/achievement_list.dart';

import '../../data/dto/achievement_dto.dart';

import '../../data/dto/beginner_quiz_word_list_response.dart';
import '../../data/dto/current_course_response.dart';
import '../../data/dto/flash_card_list_response.dart';
import '../../data/dto/interface_language_response.dart';
import '../../data/dto/language_list_response.dart';
import '../../data/dto/learned_word_list_response.dart';
import '../../data/dto/login_user_response.dart';
import '../../data/dto/register_user_response.dart';
import '../../data/dto/registeration_response.dart';
import '../../data/dto/update_register_status_response.dart';
import '../../data/dto/update_user_current_course_response.dart';
import '../../data/dto/update_user_interface_language_response.dart';
import '../../data/dto/user_response.dart';
import '../../data/dto/user_settings_response.dart';
import '../../data/dto/word_list_response.dart';
import '../../data/network/request/login_user_request.dart';
import '../../data/network/request/models/begginer_quiz_request_model.dart';
import '../../data/network/request/models/flash_card_list_request_model.dart';
import '../../data/network/request/models/insert_learned_words.request.model.dart';
import '../../data/network/request/models/words_by_topic_request_model.dart';
import '../../data/network/request/register_user_request.dart';
import '../../data/network/request/update_register_status_request.dart';
import '../../data/network/request/update_user_current_course_request.dart';
import '../../data/network/request/update_user_interface_language_request.dart';
import '../../data/network/request/user_settings_request.dart';

abstract class ServerInterface {
  Future<WordListResponse> getAllWords();
  Future<WordListResponse> getWordsByTopic(WordsByTopicModel request);
  Future<WordListResponse> getAllLearnedWords(int userID);
  Future<WordListResponse> getLearnedWordsByTopic(String topic, int userID);
  Future<AchievementListResponse> getAllAchievements();
  Future<AchievementDto> getAchievementById(int id);
  Future<AchievementListResponse> getUserAchievements(int userID);
  Future<RegisterUserResponse> registerUser(
      RegisterUserRequest registerRequest);
  Future<LoginUserResponse> loginUser(LoginUserRequest loginRequest);
  Future<RegisterationResponse> getRegisterationStatus(String userId);

  Future<LanguageListResponse> getAvailableLanguages();
  Future<UpdateUserInterfaceLanguageResponse> switchInterfaceLanguage(
      UpdateUserInterfaceLanguageRequest userUpdateinterfaceLanguageRequest);
  Future<UpdateRegisterationStatusResponse> updateRegisterationStatus(
      UpdateRegisterStatusRequest request);
  Future<UpdateUserCurrentCourseResponse> switchCurrentCourse(
      UpdateUserCurrentCourseRequest request);
  Future<CurrentCourseResponse> getUserCurrentCourse(String userId);
  Future<FlashCardListResponse> createFlashCardList(FlashCardListModel request);

  Future<BeginnerQuizWordListResponse> getBeginnerQuizWordList(
      BeginnerQuizModel request);
  Future<LearnedWordListResponse> getLearnedWordList(String userId);
  Future<void> insertLearnedWordList(InsertLearnedWordsModel request);
  Future<UserSettingsResponse> getUserSettings(UserSettingsRequest request);

  //Future<int> getWordiesCountByTopic(String topic);
}
