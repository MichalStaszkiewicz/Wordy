import 'package:dio/dio.dart';

class BadNetworkApiError extends DioError {
  BadNetworkApiError({required super.requestOptions});
}
