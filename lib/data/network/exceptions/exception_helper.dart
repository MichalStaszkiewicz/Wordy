import 'dart:io';

import 'package:dio/dio.dart';
import 'package:wordy/data/network/exceptions/unexpected_error.dart';
import 'package:wordy/data/network/exceptions/validation_error.dart';

import '../../../const/server_messages.dart';
import '../../../domain/models/custom_error.dart';
import 'api_errors/api_error_message.dart';

class ExceptionHelper implements Exception {
  static CustomError getErrorMessage(Exception exception) {
    if (exception is DioError) {
      if (exception.type == DioErrorType.response) {
        var error = ApiErrorMessage.fromJson(
            exception.response!.data as Map<String, dynamic>);

        return CustomError(
            title: error.error, message: error.message, critical: false);
      } else if (exception.type == DioErrorType.cancel) {
        return const CustomError(
            title: 'Error',
            message: ServerMessages.MESSAGE_REQUEST_CANCELED_BY_USER,
            critical: false);
      } else if (exception.type == DioErrorType.response) {
        return CustomError(
            title: 'Error', message: exception.message, critical: false);
      } else if (exception.type == DioErrorType.connectTimeout) {
        return const CustomError(
            title: "Error",
            message: ServerMessages.MESSAGE_TIMEOUT,
            critical: false);
      }
      if (exception.error is SocketException) {
        return const CustomError(
            title: 'Error',
            message: ServerMessages.MESSAGE_POOR_CONNECTIVITY_BY_USER,
            critical: true);
      }
    }

    if (exception is UnexpectedError) {
      return const CustomError(
          title: 'Wops',
          message:
              "Unexpected error you will be logged out. sorry for difficulties",
          critical: true);
    }
    if (exception is ValidationError) {
      return CustomError(
          title: exception.title, message: exception.message, critical: false);
    } else {
      return const CustomError(
          title: 'Error', message: 'Unknown Error', critical: true);
    }
  }
}
