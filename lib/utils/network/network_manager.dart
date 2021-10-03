import 'package:dio/dio.dart';
import 'package:flutter_mvi_starter/utils/network/const.dart';
import 'package:flutter_mvi_starter/utils/network/network_exceptions.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'network_request.dart';

class NetworkManager {
  final Dio _dio = Dio();
  NetworkManager(){
    initDio();
  }

  void initDio() {
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = 20000;
    _dio.options.receiveTimeout = 20000;

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler,){
          // Authorization
          final bool isAuthorized = options.extra['isAuthorized'] as bool;
          if (isAuthorized) {
            // todo add authorization header
            // final String token = Get.find<SharedPreferencesService>().token;
            // options.headers['Authorization'] = 'Bearer $token';
          }
          // Language
          // todo add language interceptor
          /*final AppLocale locale = Get.find<LocalizationService>().currentLocale;
          if (locale.languageCode != null) {
            options.headers['Accept-Language'] = locale.languageCode;
          }*/
          return handler.next(options);
        }
      )
    );
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        compact: false
      )
    );
  }

  Future<dynamic> perform(NetworkRequest request) async {
    final Response<dynamic> response = await _dio.request<dynamic>(
      request.url,
      data: request.data,
      options: _getOptions(request),
    );
    return response.data;
  }

  Options _getOptions(NetworkRequest request) {
    return Options(
      headers: request.headers,
      method: request.method.name,
      extra: <String, dynamic>{'isAuthorized': request.isAuthorized}, // read this later in interceptor to send token if needed
      validateStatus: isValidStatusCode,
    );
  }

  bool isValidStatusCode(int? statusCode) {
    if (statusCode == 401) {
      throw UnAuthorizedException();
    } else if (statusCode == 403) {
      throw ForbiddenException();
    } else {
      return true;
    }
  }

}