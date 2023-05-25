import 'package:dio/dio.dart';
import 'package:wordy/data/dto/achievement_list.dart';
import 'package:wordy/domain/models/user.dart';

import '../../data/dto/achievement_dto.dart';

import '../../data/dto/beginner_quiz_word_list_response.dart';
import '../../data/dto/flash_card_list_response.dart';
import '../../data/dto/language_response.dart';
import '../../data/dto/language_list_response.dart';
import '../../data/dto/learned_word_list_response.dart';
import '../../data/dto/login_user_response.dart';
import '../../data/dto/register_status_response.dart';
import '../../data/dto/register_user_response.dart';
import '../../data/dto/update_register_status_response.dart';
import '../../data/dto/update_user_current_course_response.dart';
import '../../data/dto/update_user_interface_language_response.dart';
import '../../data/dto/user_data_response.dart';
import '../../data/dto/word_list_response.dart';
import '../../data/network/request/login_user_request.dart';
import '../../data/network/request/models/begginer_quiz_request_model.dart';
import '../../data/network/request/models/flash_card_list_request_model.dart';
import '../../data/network/request/models/words_by_topic_request_model.dart';
import '../../data/network/request/register_user_request.dart';
import '../../data/network/request/update_register_status_request.dart';
import '../../data/network/request/update_user_current_course_request.dart';
import '../../data/network/request/update_user_interface_language_request.dart';

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
  Future<RegisterStatusResponse> registerationStatus(String userId);
  Future<LanguageListResponse> getAvailableLanguages();
  Future<LanguageResponse> getUserInterfaceLanguage(String userId);
  Future<UserDataResponse> getUserData(String userId);
  Future<UpdateUserInterfaceLanguageResponse> updateUserInterfaceLanguage(
      UpdateUserInterfaceLanguageRequest userUpdateinterfaceLanguageRequest);
  Future<UpdateRegisterStatusResponse> updateRegisterStatus(
      UpdateRegisterStatusRequest request);
  Future<UpdateUserCurrentCourseResponse> updateUserCurrentCourse(
      UpdateUserCurrentCourseRequest request);
  Future<FlashCardListResponse> createFlashCardList(FlashCardListModel request);

  Future<BeginnerQuizWordListResponse> getBeginerQuizWordList(
      BeginnerQuizModel request);
  Future<LearnedWordListResponse> getLearnedWordList(String userId);
  //Future<int> getWordiesCountByTopic(String topic);
}
