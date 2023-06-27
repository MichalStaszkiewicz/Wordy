import 'package:dio/dio.dart';
import 'package:wordy/data/network/remote_source.dart';

import 'package:wordy/domain/logic/user_service.dart';

import '../../../Utility/locator/service_locator.dart';
import '../../../domain/repositiories/repository.dart';
import '../../../utility/either.dart';
import '../../../utility/socket_manager.dart';
import '../response/refresh_room_request.dart';

class TokenInterceptor extends Interceptor {
  Dio? _dio;

  TokenInterceptor(Dio dio) {
    _dio = dio;
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final newToken = await _refreshToken();

      if (newToken.isError) {
     
        return;
      }
      err.requestOptions.headers['Authorization'] = '${newToken.data}';
      var options = err.requestOptions;
      Response? response = await _dio?.request(err.requestOptions.path,
          data: err.requestOptions.data,
          options: Options(
              method: options.method,
              sendTimeout: options.sendTimeout,
              receiveTimeout: options.receiveTimeout,
              extra: options.extra,
              headers: options.headers,
              responseType: options.responseType,
              contentType: options.contentType,
              validateStatus: options.validateStatus,
              receiveDataWhenStatusError: options.receiveDataWhenStatusError,
              followRedirects: options.followRedirects,
              maxRedirects: options.maxRedirects,
              requestEncoder: options.requestEncoder,
              responseDecoder: options.responseDecoder,
              listFormat: options.listFormat));
      if (response != null) {
        locator<SocketManager>().refreshToken(RefreshRoomRequest(
            newToken: newToken.data!, oldToken: newToken.data!));
        return handler.resolve(response);
      }
      return;
    }

    return handler.next(err);
  }

  Future<Either<Exception, String>> _refreshToken() async {
    var refreshToken = await locator<UserService>().getTokenRefresh();

   
    if (refreshToken.isError) {
      return Either.error(refreshToken.error!);
    }
    var newAccessToken =
        await locator<RemoteSource>().refreshToken(refreshToken.data!);
    if (newAccessToken.isError) {
      return Either.error(newAccessToken.error!);
    }
    locator<Repository>().saveTokenAccess(newAccessToken.data!.token);
  
    return Either.data(newAccessToken.data!.token);
  }
}
