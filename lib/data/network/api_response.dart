import 'package:dio/dio.dart';

class ApiResponse<T> {
  final T? data;
  final String message;

  ApiResponse({
    required this.data,
    required this.message,
  });
}
