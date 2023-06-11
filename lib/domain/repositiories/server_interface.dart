import 'package:dio/dio.dart';
import 'package:wordy/data/dto/achievement_list.dart';

import '../../data/dto/achievement_dto.dart';

import '../../data/dto/active_course_response.dart';
import '../../data/dto/beginner_quiz_word_list_response.dart';
import '../../data/dto/course_list_response.dart';
import '../../data/dto/flash_card_list_response.dart';
import '../../data/dto/language_list_response.dart';
import '../../data/dto/learned_word_list_response.dart';
import '../../data/dto/login_user_response.dart';
import '../../data/dto/register_user_response.dart';
import '../../data/dto/registeration_response.dart';
import '../../data/dto/update_register_status_response.dart';
import '../../data/dto/update_user_current_course_response.dart';
import '../../data/dto/update_user_interface_language_response.dart';
import '../../data/dto/user_active_courses_progress_response.dart';
import '../../data/dto/user_course_response.dart';
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
import '../../utility/either.dart';

abstract class ServerInterface {
  Future<Either<DioError, WordListResponse>> getAllWords();
  Future<Either<DioError, WordListResponse>> getWordsByTopic(
      WordsByTopicModel request);
  Future<Either<DioError, WordListResponse>> getAllLearnedWords(int userID);
  Future<Either<DioError, WordListResponse>> getLearnedWordsByTopic(
      String topic, String userId);
  Future<Either<DioError, AchievementListResponse>> getAllAchievements();
  Future<Either<DioError, AchievementDto>> getAchievementById(int id);
  Future<Either<DioError, AchievementListResponse>> getUserAchievements(
      int userID);
  Future<Either<DioError, RegisterUserResponse>> registerUser(
      RegisterUserRequest registerRequest);
  Future<Either<DioError, LoginResponse>> loginUser(
      LoginUserRequest loginRequest);
  Future<Either<DioError, RegisterationResponse>> getRegisterationStatus(
      String userId);

  Future<Either<DioError, LanguageListResponse>> getAvailableLanguages();
  Future<Either<DioError, UpdateUserInterfaceLanguageResponse>>
      switchInterfaceLanguage(
          UpdateUserInterfaceLanguageRequest
              userUpdateinterfaceLanguageRequest);
  Future<Either<DioError, UpdateRegisterationStatusResponse>>
      updateRegisterationStatus(UpdateRegisterStatusRequest request);
  Future<Either<DioError, UpdateUserCurrentCourseResponse>> switchCurrentCourse(
      UpdateUserCurrentCourseRequest request);
  Future<Either<DioError, UserCourseResponse>> getUserCurrentCourse(
      String userId);
  Future<Either<DioError, FlashCardListResponse>> createFlashCardList(
      FlashCardListModel request);

  Future<Either<DioError, BeginnerQuizWordListResponse>>
      getBeginnerQuizWordList(BeginnerQuizModel request);
  Future<Either<DioError, LearnedWordListResponse>> getLearnedWordList(
      String userId);
  Future<Either<DioError, void>> insertLearnedWordList(
      InsertLearnedWordsModel request);
  Future<Either<DioError, UserSettingsResponse>> getUserSettings(
      UserSettingsRequest request);
  Future<Either<DioError, void>> cancelRequest();
  Future<Either<DioError, UserActiveCoursesProgressResponse>>
      getUserActiveCoursesProgress(String userId);
  Future<Either<DioError, CourseListResponse>> getAvailableCourses(
      String userId);
  Future<Either<DioError, ActiveCourseResponse>> getUserCurrentCourseProgress(
      String userId);
}
