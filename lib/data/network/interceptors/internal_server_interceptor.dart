import 'package:dio/dio.dart';

import '../exceptions/api_errors/internal_server_api_error.dart';
import '../exceptions/internal_server_exception.dart';

class InternalServerInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response!.statusCode != null && err.response!.statusCode! >= 500) {
      return handler.reject(
          InternalServerApiError(requestOptions: err.response!.requestOptions));
    }

    super.onError(err, handler);
  }
}
