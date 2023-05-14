import 'package:dio/dio.dart';

class NoInternetError extends DioError {
  NoInternetError(RequestOptions requestOptions)
      : super(requestOptions: requestOptions);
}
