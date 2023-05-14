import 'package:dio/dio.dart';
import 'package:wordy/data/network/exceptions/api_error_message_exception.dart';
import 'package:wordy/data/network/exceptions/api_errors/api_error_message.dart';

import '../exceptions/server_error_exception.dart';

class ServerErrorInterceptor extends Interceptor {
  @override
  Future onError(DioError dioError, ErrorInterceptorHandler handler) async {
    if (dioError.response?.data['message'] != null) {
      return handler.reject(ApiErrorMessage(
          requestOptions: dioError.requestOptions,
          message: dioError.response?.data['message']));
    }
    return handler.next(dioError);
  }
}
