import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:wordy/data/network/exceptions/api_error_message_exception.dart';
import 'package:wordy/data/network/exceptions/api_errors/api_error_message.dart';
import 'package:wordy/data/network/exceptions/api_errors/bad_network_api_error.dart';
import 'package:wordy/data/network/exceptions/api_errors/internal_server_api_error.dart';
import 'package:wordy/data/network/exceptions/bad_network_exception.dart';
import 'package:wordy/data/network/exceptions/internal_server_exception.dart';
import 'package:wordy/data/network/interceptors/internal_server_interceptor.dart';
import 'package:wordy/data/network/interceptors/server_error_interceptort.dart';

import 'interceptors/bad_netword_interceptor.dart';

class ApiService {
  final String baseUrl;
  final Dio dio;
  ApiService({required this.baseUrl})
      : dio = Dio(BaseOptions(baseUrl: baseUrl)) {
    dio.interceptors.add(ServerErrorInterceptor());
    dio.interceptors.add(InternalServerInterceptor());

    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
  }

  Future<Response> get(String endpoint, {Map<String, dynamic>? payload}) async {
    try {
      return await dio.get(endpoint, queryParameters: payload);
    } on BadNetworkApiError {
      throw BadNetworkException("Check your network connection");
    } on ApiErrorMessage catch (e) {
      throw ApiErrorMessageException(errorMessage: e.message);
    } on InternalServerApiError {
      throw InternalServerException("Internal Server Error");
    }
  }

  Future<Response> post(String endpoint,
      {Map<String, dynamic>? payload}) async {
    try {
      return await dio.post(endpoint, data: payload);
    } on BadNetworkApiError {
      throw BadNetworkException("Check your network connection");
    } on ApiErrorMessage catch (e) {
      throw ApiErrorMessageException(errorMessage: e.message);
    } on InternalServerApiError {
      throw InternalServerException("Internal Server Error");
    }
  }

  Future<dynamic> put(String endpoint, {Map<String, dynamic>? payload}) async {
    try {
      final response = await dio.put(endpoint, data: payload);
      return response;
    } on BadNetworkApiError {
      throw BadNetworkException("Check your network connection");
    } on ApiErrorMessage catch (e) {
      throw ApiErrorMessageException(errorMessage: e.message);
    } on InternalServerApiError {
      throw InternalServerException("Internal Server Error");
    }
  }

  Future<dynamic> delete(String endpoint) async {
    try {
      final response = await dio.delete(endpoint);
      return response.data;
    } on BadNetworkApiError {
      throw BadNetworkException("Check your network connection");
    } on ApiErrorMessage catch (e) {
      throw ApiErrorMessageException(errorMessage: e.message);
    } on InternalServerApiError {
      throw InternalServerException("Internal Server Error");
    }
  }
}
