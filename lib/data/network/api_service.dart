import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:wordy/data/network/exceptions/api_error_message_exception.dart';
import 'package:wordy/data/network/exceptions/api_errors/api_error_message.dart';
import 'package:wordy/data/network/exceptions/api_errors/bad_network_api_error.dart';
import 'package:wordy/data/network/exceptions/api_errors/internal_server_api_error.dart';
import 'package:wordy/data/network/exceptions/bad_network_exception.dart';
import 'package:wordy/data/network/exceptions/internal_server_exception.dart';
import 'package:wordy/domain/logic/user_service.dart';

import '../../Utility/locator/service_locator.dart';
import 'interceptors/token_interceptor.dart';

class ApiService {
  final String baseUrl;
  final Dio dio;
  CancelToken cancelToken = CancelToken();
  ApiService({required this.baseUrl})
      : dio = Dio(BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: Duration(milliseconds: 10000),
            receiveTimeout: Duration(milliseconds: 10000))) {
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    dio.interceptors.add(TokenInterceptor(dio));
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        var token = await locator<UserService>().getTokenAccess();
        options.headers['Authorization'] = 'Bearer ${token.data}';

        return handler.next(options);
      },
    ));
//    dio.interceptors.add(InternalServerInterceptor());
  }
  Future<bool> cancelRequests() async {
    if (!cancelToken.isCancelled) {
      cancelToken.cancel();

      return true;
    } else {
      return false;
    }
  }

  void resetCancelToken() {
    cancelToken = CancelToken();
  }

  Future<Response> get(String endpoint,
      {Map<String, dynamic>? payload, Options? options}) async {
    resetCancelToken();
    try {
      return await dio.get(endpoint,
          queryParameters: payload, cancelToken: cancelToken, options: options);
    } on DioError catch (e) {
      if (e is BadNetworkApiError) {
        throw BadNetworkException();
      } else {
        rethrow;
      }
    }
  }

  Future<Response> post(String endpoint,
      {Map<String, dynamic>? payload, Options? options}) async {
    resetCancelToken();
    try {
      return await dio.post(endpoint,
          data: payload, cancelToken: cancelToken, options: options);
    } on DioError catch (e) {
      if (e is BadNetworkApiError) {
        throw BadNetworkException();
      } else {
        rethrow;
      }
    }
  }

  Future<dynamic> put(String endpoint,
      {Map<String, dynamic>? payload, Options? options}) async {
    resetCancelToken();
    try {
      final response = await dio.put(endpoint,
          data: payload, cancelToken: cancelToken, options: options);
      return response;
    } on BadNetworkApiError {
      throw BadNetworkException();
    } on ApiErrorMessage {
      throw ApiErrorMessageException();
    } on InternalServerApiError {
      throw InternalServerException("Internal Server Error");
    }
  }

  Future<dynamic> delete(String endpoint) async {
    resetCancelToken();
    try {
      final response = await dio.delete(endpoint, cancelToken: cancelToken);
      return response.data;
    } on BadNetworkApiError {
      throw BadNetworkException();
    } on ApiErrorMessage {
      throw ApiErrorMessageException();
    } on InternalServerApiError {
      throw InternalServerException("Internal Server Error");
    }
  }
}
