import 'package:dio/dio.dart';

import 'package:wordy/domain/repositiories/repository.dart';

import '../../data/network/request/login_user_request.dart';
import '../../data/network/request/models/begginer_quiz_request_model.dart';
import '../../data/network/request/models/insert_learned_words.request.model.dart';

import '../../data/network/request/register_user_request.dart';

import '../../utility/either.dart';
import '../models/achievement.dart';
import '../models/flash_card_data.dart';
import '../models/word.dart';
import '../models/profile_data.dart';
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
    if (response.isData) {
      return Either.data(response.data!);
    } else {
      return Either.error(response.error);
    }
  }

  Future<Either<DioError, String>> switchInterfaceLangauge(
      String token, String languageName) async {
    var response =
        await _repository.switchInterfaceLangauge(token, languageName);
    if (response.isData) {
      return Either.data(response.data!);
    } else {
      return Either.error(response.error);
    }
  }

  Future<Either<DioError, RegisterationStatus>> getRegisterationStatus(
      String userId) async {
    var response = await _repository.getRegisterationStatus(userId);

    if (response.data != null) {
      return Either.data(response.data);
    } else {
      return Either.error(response.error);
    }
  }

  Future<Either<DioError, UserSettings>> getUserSettings(String token) async {
    var response = await _repository.getUserSettings(token);
    if (response.data != null) {
      return Either.data(response.data!);
    } else {
      return Either.error(response.error);
    }
  }

  Future<Either<DioError, void>> insertLearnedWordList(
      List<int> wordIdList, String token) async {
    var response = await _repository.insertLearnedWordList(wordIdList, token);
    if (response.error != null) {
      return Either.data(response.error!);
    }
    return Either.data(null);
  }

  Future<Either<DioError, List<Word>>> getLearnedWordList(String token) async {
    var response = await _repository.getLearnedWordList(token);
    if (response.data != null) {
      return Either.data(response.data!);
    } else {
      return Either.error(response.error);
    }
  }

  Future<Either<DioError, List<Word>>> getBeginnerQuizWordList(
      String topic, String token) async {
    var response = await _repository.getBeginnerQuizWordList(topic, token);
    if (response.data != null) {
      return Either.data(response.data!);
    } else {
      return Either.error(response.error);
    }
  }

  Future<Either<DioError, List<FlashCardData>>> createFlashCardList(
      String topic, String token) async {
    var response = await _repository.createFlashCardList(topic, token);
    if (response.data != null) {
      return Either.data(response.data!);
    } else {
      return Either.error(response.error);
    }
  }

  Future<Either<DioError, UserCourse>> updateUserCurrentCourse(
      String courseName, String token) async {
    var response = await _repository.updateUserCurrentCourse(courseName, token);
    if (response.data != null) {
      return Either.data(response.data!);
    } else {
      return Either.error(response.error);
    }
  }

  Future<Either<DioError, UserCourse>> getUserCurrentCourse(
      String userId) async {
    var response = await _repository.getUserCurrentCourse(userId);
    if (response.data != null) {
      return Either.data(response.data!);
    } else {
      return Either.error(response.error);
    }
  }

  Future<Either<DioError, String>> updateUserRegisterStatus(
      String token) async {
    var response = await _repository.updateUserRegisterStatus(token);
    if (response.data != null) {
      return Either.data(response.data!);
    } else {
      return Either.error(response.error);
    }
  }

  Future<Either<DioError, String>> loginUser(LoginUserRequest request) async {
    var response = await _repository.loginUser(request);
    if (response.data != null) {
      return Either.data(response.data!);
    } else {
      return Either.error(response.error);
    }
  }

  Future<Either<DioError, String>> registerUser(
      RegisterUserRequest request) async {
    var response = await _repository.registerUser(request);
    if (response.data != null) {
      return Either.data(response.data!);
    } else {
      return Either.error(response.error);
    }
  }

  Future<Either<DioError, List<Word>>> getLearnedWordsByTopic(
      String topic, String token) async {
    var response = await _repository.getLearnedWordsByTopic(topic, token);
    if (response.data != null) {
      return Either.data(response.data!);
    } else {
      return Either.error(response.error);
    }
  }

  Future<Either<Exception, String>> getUserInterfaceLanguage() async {
    var response = await _repository.getUserInterfaceLanguage();

    if (response.isData) {
      return Either.data(response.data);
    } else {
      return Either.error(response.error);
    }
  }

  Future<Either<Exception, String>> synchronizeUserInterfaceLanguage() async {
    var response = await _repository.synchronizeUserInterfaceLanguage();
    if (response.isError) {
      return Either.error(response.error);
    } else {
      return Either.data(response.data);
    }
  }

  Future<Either<Exception, String>> getUserId() async {
    var response = await _repository.getToken();
    if (response.isData) {
      return Either.data(response.data);
    } else {
      return Either.error(response.error);
    }
  }

  void setUserId(String id) async {
    _repository.saveToken(id);
  }
}
