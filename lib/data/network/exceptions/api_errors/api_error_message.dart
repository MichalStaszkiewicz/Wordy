import 'package:dio/dio.dart';

class ApiErrorMessage extends DioError {
  final String message;
  ApiErrorMessage({required super.requestOptions, required this.message});
}
