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
import '../../data/dto/profile_data.dart';
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

import '../../data/network/request/register_user_request.dart';

import '../../utility/either.dart';

abstract class ServerInterface {
  Future<Either<DioError, ProfileData>> getProfileData(String token);
  Future<Either<DioError, WordListResponse>> getWordsByTopic(String topic);

  Future<Either<DioError, WordListResponse>> getLearnedWordsByTopic(
      String topic, String token);

  Future<Either<DioError, RegisterUserResponse>> registerUser(
      RegisterUserRequest registerRequest);
  Future<Either<DioError, LoginResponse>> loginUser(
      LoginUserRequest loginRequest);
  Future<Either<DioError, RegisterationResponse>> getRegisterationStatus(
      String token);

  Future<Either<DioError, LanguageListResponse>> getAvailableLanguages();
  Future<Either<DioError, UpdateUserInterfaceLanguageResponse>>
      switchInterfaceLanguage(String token, String languageName);
  Future<Either<DioError, UpdateRegisterationStatusResponse>>
      updateRegisterationStatus(String token);
  Future<Either<DioError, UpdateUserCurrentCourseResponse>> switchCurrentCourse(
      String token, String courseName);
  Future<Either<DioError, UserCourseResponse>> getUserCurrentCourse(
      String token);
  Future<Either<DioError, FlashCardListResponse>> createFlashCardList(
      String topic);

  Future<Either<DioError, BeginnerQuizWordListResponse>>
      getBeginnerQuizWordList(String topic, String token);
  Future<Either<DioError, LearnedWordListResponse>> getLearnedWordList(
      String token);
  Future<Either<DioError, void>> insertLearnedWordList(
      List<int> wordIds, String token);
  Future<Either<DioError, UserSettingsResponse>> getUserSettings(String token);
  Future<Either<DioError, void>> cancelRequest();
  Future<Either<DioError, UserActiveCoursesProgressResponse>>
      getUserActiveCoursesProgress(String token);
  Future<Either<DioError, CourseListResponse>> getAvailableCourses(
      String token);
  Future<Either<DioError, ActiveCourseResponse>> getUserCurrentCourseProgress(
      String token);
}
