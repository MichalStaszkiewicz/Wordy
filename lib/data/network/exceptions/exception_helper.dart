import 'package:dio/dio.dart';
import 'package:wordy/data/network/exceptions/validation_error.dart';

import '../../../domain/models/custom_error.dart';
import 'api_errors/api_error_message.dart';
import 'bad_network_exception.dart';
import 'internal_server_exception.dart';

class ExceptionHelper implements Exception {
  static CustomError getErrorMessage(Exception exception) {
    if (exception is DioError) {
      if (exception.response != null) {
        if (exception.response!.statusCode == 400) {
          var error = ApiErrorMessage.fromJson(
              exception.response!.data as Map<String, dynamic>);

          return CustomError(title: error.error, message: error.message);
        }
      } else if (exception.type == DioErrorType.cancel) {
        return CustomError(
            title: 'Error', message: 'Request has been cancelled');
      }
    }
    if (exception is ValidationError) {
      return CustomError(title: exception.title, message: exception.message);
    } else {
      return CustomError(title: 'Error', message: 'Unknown Error');
    }
  }
}
