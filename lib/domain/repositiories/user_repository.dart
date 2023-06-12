import 'package:dio/dio.dart';
import 'package:wordy/domain/models/beginner_quiz_question.dart';
import 'package:wordy/domain/repositiories/repository.dart';

import '../../data/dto/profile_data.dart';
import '../../data/network/request/login_user_request.dart';
import '../../data/network/request/models/begginer_quiz_request_model.dart';
import '../../data/network/request/models/insert_learned_words.request.model.dart';

import '../../data/network/request/register_user_request.dart';

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
  Future<Either<DioError, ProfileData>> getProfileData(
    String token,
  ) async {
    var response = await _repository.getProfileData(token);
    if (response.right != null) {
      return Either.data(response.right!);
    } else {
      return Either.error(response.left);
    }
  }

  Future<Either<DioError, String>> switchInterfaceLangauge(
      String token, String languageName) async {
    var response =
        await _repository.switchInterfaceLangauge(token, languageName);
    if (response.right != null) {
      return Either.data(response.right!);
    } else {
      return Either.error(response.left);
    }
  }

  Future<Either<DioError, RegisterationStatus>> getRegisterationStatus(
      String userId) async {
    var response = await _repository.getRegisterationStatus(userId);

    if (response.right != null) {
      return Either.data(response.right);
    } else {
      return Either.error(response.left);
    }
  }

  Future<Either<DioError, UserSettings>> getUserSettings(String token) async {
    var response = await _repository.getUserSettings(token);
    if (response.right != null) {
      return Either.data(response.right!);
    } else {
      return Either.error(response.left);
    }
  }

  Future<Either<DioError, void>> insertLearnedWordList(
      List<int> wordIdList, String token) async {
    var response = await _repository.insertLearnedWordList(wordIdList, token);
    if (response.left != null) {
      return Either.data(response.left!);
    }
    return Either.data(null);
  }

  Future<Either<DioError, List<LearnedWord>>> getLearnedWordList(
      String token) async {
    var response = await _repository.getLearnedWordList(token);
    if (response.right != null) {
      return Either.data(response.right!);
    } else {
      return Either.error(response.left);
    }
  }

  Future<Either<DioError, List<BeginnerQuizQuestion>>> getBeginnerQuizWordList(
      String topic, String token) async {
    var response = await _repository.getBeginnerQuizWordList(topic, token);
    if (response.right != null) {
      return Either.data(response.right!);
    } else {
      return Either.error(response.left);
    }
  }

  Future<Either<DioError, List<FlashCardData>>> createFlashCardList(
      String topic) async {
    var response = await _repository.createFlashCardList(topic);
    if (response.right != null) {
      return Either.data(response.right!);
    } else {
      return Either.error(response.left);
    }
  }

  Future<Either<DioError, UserCourse>> updateUserCurrentCourse(
      String courseName, String token) async {
    var response = await _repository.updateUserCurrentCourse(courseName, token);
    if (response.right != null) {
      return Either.data(response.right!);
    } else {
      return Either.error(response.left);
    }
  }

  Future<Either<DioError, UserCourse>> getUserCurrentCourse(
      String userId) async {
    var response = await _repository.getUserCurrentCourse(userId);
    if (response.right != null) {
      return Either.data(response.right!);
    } else {
      return Either.error(response.left);
    }
  }

  Future<Either<DioError, bool>> updateUserRegisterStatus(String token) async {
    var response = await _repository.updateUserRegisterStatus(token);
    if (response.right != null) {
      return Either.data(response.right!);
    } else {
      return Either.error(response.left);
    }
  }

  Future<Either<DioError, String>> loginUser(LoginUserRequest request) async {
    var response = await _repository.loginUser(request);
    if (response.right != null) {
      return Either.data(response.right!);
    } else {
      return Either.error(response.left);
    }
  }

  Future<Either<DioError, String>> registerUser(
      RegisterUserRequest request) async {
    var response = await _repository.registerUser(request);
    if (response.right != null) {
      return Either.data(response.right!);
    } else {
      return Either.error(response.left);
    }
  }

  Future<Either<DioError, List<Word>>> getLearnedWordsByTopic(
      String topic, String token) async {
    var response = await _repository.getLearnedWordsByTopic(topic, token);
    if (response.right != null) {
      return Either.data(response.right!);
    } else {
      return Either.error(response.left);
    }
  }

  Future<Either<Exception, String>> getUserInterfaceLanguage() async {
    var response = await _repository.getUserInterfaceLanguage();

    if (response.isRight) {
      return Either.data(response.right);
    } else {
      return Either.error(response.left);
    }
  }

  Future<Either<Exception, String>> synchronizeUserInterfaceLanguage() async {
    var response = await _repository.synchronizeUserInterfaceLanguage();
    if (response.isLeft) {
      return Either.error(response.left);
    } else {
      return Either.data(response.right);
    }
  }

  Future<Either<Exception, String>> getUserId() async {
    var response = await _repository.getToken();
    if (response.isRight) {
      return Either.data(response.right);
    } else {
      return Either.error(response.left);
    }
  }

  void setUserId(String id) async {
    _repository.saveToken(id);
  }
}
