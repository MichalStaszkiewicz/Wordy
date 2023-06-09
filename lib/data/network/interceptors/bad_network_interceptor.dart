import 'package:dio/dio.dart';
import 'package:wordy/data/network/exceptions/api_errors/bad_network_api_error.dart';


class BadNetworkInterceptor extends Interceptor {
  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.type == DioErrorType.cancel) {
 
      return handler
          .reject(BadNetworkApiError(requestOptions: err.requestOptions));
    }

    return handler.next(err);
  }
}
