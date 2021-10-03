import 'package:dio/dio.dart';
import 'package:flutter_mvi_starter/utils/network/const.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

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
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        compact: false
      )
    );

    // todo add language interceptor

    // todo add authorization header
  }

}