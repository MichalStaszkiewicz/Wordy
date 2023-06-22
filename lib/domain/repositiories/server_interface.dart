import 'package:dio/dio.dart';

import '../../data/network/request/login_user_request.dart';

import '../../data/network/request/register_user_request.dart';

import '../../data/network/response/course_list_response.dart';
import '../../data/network/response/flash_card_list_response.dart';
import '../../data/network/response/language_list_response.dart';
import '../../data/network/response/learned_words_list.dart';
import '../../data/network/response/login_user_response.dart';
import '../../data/network/response/refresh_token_response.dart';
import '../../data/network/response/register_user_response.dart';
import '../../data/network/response/registeration_response.dart';
import '../../data/network/response/update_registeration_status_response.dart';
import '../../data/network/response/update_user_current_course_response.dart';
import '../../data/network/response/update_user_interface_language_response.dart';
import '../../utility/either.dart';
import '../models/active_course.dart';
import '../models/profile_data.dart';
import '../models/user_active_courses_progress.dart';
import '../models/user_course.dart';
import '../models/user_settings.dart';
import '../models/word.dart';

abstract class ServerInterface {
  Future<Either<DioError, RefreshTokenResponse>> refreshToken(
      String refreshToken);
  Future<Either<DioError, ProfileData>> getProfileData(String token);
  Future<Either<DioError, LearnedWordsList>> getWordsByTopic(String topic);

  Future<Either<DioError, LearnedWordsList>> getLearnedWordsByTopic(
      String topic, String token);

  Future<Either<DioError, RegisterUserResponse>> registerUser(
      RegisterUserRequest registerRequest);
  Future<Either<DioError, LoginUserResponse>> loginUser(
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
  Future<Either<DioError, UserCourse>> getUserCurrentCourse(String token);
  Future<Either<DioError, FlashCardListResponse>> createFlashCardList(
      String topic, String token);

  Future<Either<DioError, FlashCardListResponse>> getBeginnerQuizWordList(
      String topic, String token);
  Future<Either<DioError, LearnedWordsList>> getLearnedWordList(String token);
  Future<Either<DioError, void>> insertLearnedWordList(
      List<int> wordIds, String token);
  Future<Either<DioError, UserSettings>> getUserSettings(String token);
  Future<Either<DioError, void>> cancelRequest();
  Future<Either<DioError, UserActiveCoursesProgress>>
      getUserActiveCoursesProgress(String token);
  Future<Either<DioError, CourseListResponse>> getAvailableCourses(
      String token);
  Future<Either<DioError, ActiveCourse>> getUserCurrentCourseProgress(
      String token);
}
