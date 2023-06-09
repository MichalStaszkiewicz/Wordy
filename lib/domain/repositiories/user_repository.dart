import 'package:dio/dio.dart';
import 'package:wordy/domain/models/beginner_quiz_question.dart';
import 'package:wordy/domain/repositiories/repository.dart';

import '../../data/network/request/login_user_request.dart';
import '../../data/network/request/models/begginer_quiz_request_model.dart';
import '../../data/network/request/models/flash_card_list_request_model.dart';
import '../../data/network/request/models/insert_learned_words.request.model.dart';
import '../../data/network/request/models/update_user_interface_language_request_model.dart';
import '../../data/network/request/models/user_settings_request_model.dart';
import '../../data/network/request/register_user_request.dart';
import '../../data/network/request/update_register_status_request.dart';
import '../../data/network/request/update_user_current_course_request.dart';
import '../../utility/either.dart';
import '../models/achievement.dart';
import '../models/flash_card_data.dart';
import '../models/learned_word.dart';
import '../models/registeration_status.dart';
import '../models/user_course.dart';
import '../models/user_settings.dart';
import '../models/word.dart';

class UserRepository {
  UserRepository(this._repository);
  final Repository _repository;
  Future<Either<DioError, String>> switchInterfaceLangauge(
      UpdateUserInterfaceLanguageModel model) async {
    var response = await _repository.switchInterfaceLangauge(model);
    if (response.right != null) {
      return Either.right(response.right!);
    } else {
      return Either.left(response.left);
    }
  }

  Future<Either<DioError, RegisterationStatus>> getRegisterationStatus(
      String userId) async {
    var response = await _repository.getRegisterationStatus(userId);

    if (response.right != null) {
      return Either.right(response.right);
    } else {
      return Either.left(response.left);
    }
  }

  Future<Either<DioError, UserSettings>> getUserSettings(
      UserSettingsRequestModel request) async {
    var response = await _repository.getUserSettings(request);
    if (response.right != null) {
      return Either.right(response.right!);
    } else {
      return Either.left(response.left);
    }
  }

  Future<Either<DioError, void>> insertLearnedWordList(
      InsertLearnedWordsModel model) async {
    var response = await _repository.insertLearnedWordList(model);
    if (response.left != null) {
      return Either.right(response.left!);
    }
    return Either.right(null);
  }

  Future<Either<DioError, List<LearnedWord>>> getLearnedWordList(
      String userId) async {
    var response = await _repository.getLearnedWordList(userId);
    if (response.right != null) {
      return Either.right(response.right!);
    } else {
      return Either.left(response.left);
    }
  }

  Future<Either<DioError, List<BeginnerQuizQuestion>>> getBeginnerQuizWordList(
      BeginnerQuizModel request) async {
    var response = await _repository.getBeginnerQuizWordList(request);
    if (response.right != null) {
      return Either.right(response.right!);
    } else {
      return Either.left(response.left);
    }
  }

  Future<Either<DioError, List<FlashCardData>>> createFlashCardList(
      FlashCardListModel request) async {
    var response = await _repository.createFlashCardList(request);
    if (response.right != null) {
      return Either.right(response.right!);
    } else {
      return Either.left(response.left);
    }
  }

  Future<Either<DioError, UserCourse>> updateUserCurrentCourse(
      UpdateUserCurrentCourseRequest request) async {
    var response = await _repository.updateUserCurrentCourse(request);
    if (response.right != null) {
      return Either.right(response.right!);
    } else {
      return Either.left(response.left);
    }
  }

  Future<Either<DioError, UserCourse>> getUserCurrentCourse(
      String userId) async {
    var response = await _repository.getUserCurrentCourse(userId);
    if (response.right != null) {
      return Either.right(response.right!);
    } else {
      return Either.left(response.left);
    }
  }

  Future<Either<DioError, bool>> updateUserRegisterStatus(
      UpdateRegisterStatusRequest request) async {
    var response = await _repository.updateUserRegisterStatus(request);
    if (response.right != null) {
      return Either.right(response.right!);
    } else {
      return Either.left(response.left);
    }
  }

  Future<Either<DioError, String>> loginUser(LoginUserRequest request) async {
    var response = await _repository.loginUser(request);
    if (response.right != null) {
      return Either.right(response.right!);
    } else {
      return Either.left(response.left);
    }
  }

  Future<Either<DioError, String>> registerUser(
      RegisterUserRequest request) async {
    var response = await _repository.registerUser(request);
    if (response.right != null) {
      return Either.right(response.right!);
    } else {
      return Either.left(response.left);
    }
  }

  Future<Either<DioError, List<Achievement>>> getUserAchievements(
      int userID) async {
    var response = await _repository.getUserAchievements(userID);
    if (response.right != null) {
      return Either.right(response.right!);
    } else {
      return Either.left(response.left);
    }
  }

  Future<Either<DioError, List<Word>>> getLearnedWordsByTopic(
      String topic, String userID) async {
    var response = await _repository.getLearnedWordsByTopic(topic, userID);
    if (response.right != null) {
      return Either.right(response.right!);
    } else {
      return Either.left(response.left);
    }
  }

  Future<Either<Exception, String>> getUserInterfaceLanguage() async {
    var response = await _repository.getUserInterfaceLanguage();

    if (response.isRight) {
      return Either.right(response.right);
    } else {
      return Either.left(response.left);
    }
  }

  Future<Either<Exception, String>> synchronizeUserInterfaceLanguage() async {
    var response = await _repository.synchronizeUserInterfaceLanguage();
    if (response.isLeft) {
      return Either.left(response.left);
    } else {
      return Either.right(response.right);
    }
  }

  Future<Either<Exception, String>> getUserId() async {
    var response = await _repository.getUserId();
    if (response.isRight) {
      return Either.right(response.right);
    } else {
      return Either.left(response.left);
    }
  }

  void setUserId(String id) async {
    _repository.setUserId(id);
  }
}
