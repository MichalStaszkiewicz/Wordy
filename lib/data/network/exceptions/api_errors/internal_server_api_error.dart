import 'package:dio/dio.dart';

class InternalServerApiError extends DioError {
  InternalServerApiError({required super.requestOptions});
}
