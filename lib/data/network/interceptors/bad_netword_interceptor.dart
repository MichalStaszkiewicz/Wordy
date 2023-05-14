import 'package:dio/dio.dart';
import 'package:wordy/data/network/exceptions/api_errors/bad_network_api_error.dart';

import '../exceptions/bad_network_exception.dart';

class BadNetworkInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.type == DioErrorType.connectTimeout ||
        err.type == DioErrorType.receiveTimeout ||
        err.type == DioErrorType.sendTimeout ||
        err.type == DioErrorType.other ||
        err.type == DioErrorType.cancel) {
      handler.reject(BadNetworkApiError(requestOptions: err.requestOptions));
    }
  }
}
