import 'dart:io';

import 'package:dio/dio.dart';
import 'package:wordy/Utility/locator/service_locator.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/const/error_codes.dart';
import 'package:wordy/data/network/exceptions/unexpected_error.dart';
import 'package:wordy/data/network/exceptions/validation_error.dart';
import 'package:wordy/global/global_data_manager.dart';
import '../../../domain/models/custom_error.dart';
import 'api_errors/api_error_message.dart';

class ExceptionHelper implements Exception {
  static CustomError getErrorMessage(Exception exception) {
    var title = translate[locator<GlobalDataManager>().interfaceLanguage]![
        'server_messages']['error'];
    if (exception is DioError) {
      if (exception.type == DioErrorType.unknown) {
        var error = ApiErrorMessage.fromJson(
            exception.response!.data as Map<String, dynamic>);

        var message = error.message;
        if (error.message == ErrorCodes.ERROR_USER_WITH_EMAIL_EXISTS) {
          message = translate[locator<GlobalDataManager>().interfaceLanguage]![
              'server_messages']['user_exists'];
        }
        if (error.message == ErrorCodes.ERROR_USER_DOES_NOT_EXIST) {
          message = translate[locator<GlobalDataManager>().interfaceLanguage]![
              'server_messages']['user_does_not_exists'];
        }
        if (error.message == ErrorCodes.ERROR_INVALID_PASSWORD) {
          message = translate[locator<GlobalDataManager>().interfaceLanguage]![
              'server_messages']['invalid_password'];
        }
        return CustomError(title: title, message: message, critical: false);
      } else if (exception.type == DioErrorType.cancel) {
        String message = translate[locator<GlobalDataManager>()
            .interfaceLanguage]!['server_messages']['request_canceled']!;
        return CustomError(title: title, message: message, critical: false);
      } else if (exception.type == DioErrorType.unknown) {
        return CustomError(
            title: title, message: exception.message ?? '', critical: false);
      } else if (exception.type == DioErrorType.connectionTimeout) {
        String message = translate[locator<GlobalDataManager>()
            .interfaceLanguage]!['server_messages']['timeout']!;
        return CustomError(title: title, message: message, critical: false);
      }
      if (exception.error is SocketException) {
        String message = translate[locator<GlobalDataManager>()
            .interfaceLanguage]!['server_messages']['lost_connection']!;
        return CustomError(title: title, message: message, critical: true);
      }
    }

    if (exception is UnexpectedError) {
      return CustomError(
          title: translate[locator<GlobalDataManager>().interfaceLanguage]![
              'server_messages']['unexpected_error']!['title'],
          message: translate[locator<GlobalDataManager>().interfaceLanguage]![
              'server_messages']['unexpected_error']!['message'],
          critical: true);
    }
    if (exception is ValidationError) {
      return CustomError(
          title: exception.title, message: exception.message, critical: false);
    } else {
      return CustomError(
          title: title,
          message: translate[locator<GlobalDataManager>().interfaceLanguage]![
              'server_messages']['unknown_error'],
          critical: true);
    }
  }
}
