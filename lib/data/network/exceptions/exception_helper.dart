import 'package:dio/dio.dart';
import 'package:wordy/data/network/exceptions/unexpected_error.dart';
import 'package:wordy/data/network/exceptions/validation_error.dart';

import '../../../domain/models/custom_error.dart';
import 'api_errors/api_error_message.dart';

class ExceptionHelper implements Exception {
  static CustomError getErrorMessage(Exception exception) {
    if (exception is DioError) {
      if (exception.type == DioErrorType.response) {
        var error = ApiErrorMessage.fromJson(
            exception.response!.data as Map<String, dynamic>);

        return CustomError(title: error.error, message: error.message);
      } else if (exception.type == DioErrorType.cancel) {
        return CustomError(
            title: 'Error', message: 'Request has been cancelled');
      }
    }

    if (exception is UnexpectedError) {
      return CustomError(
          title: 'Wops',
          message:
              "Unexpected error you will be logged out. sorry for difficulties");
    }
    if (exception is ValidationError) {
      return CustomError(title: exception.title, message: exception.message);
    } else {
      return CustomError(title: 'Error', message: 'Unknown Error');
    }
  }
}
