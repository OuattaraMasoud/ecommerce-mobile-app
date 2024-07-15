import 'package:dio/dio.dart';
import 'package:e_commerce_project/services/services.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  static BaseOptions options = BaseOptions(
    baseUrl: locator<LocalStorageService>().apiBaseUrl,
    headers: {
      'Content-Type': 'application/json',
    },
  );

  Dio dio = Dio(options);
}

class CustomInterceptors extends Interceptor {
  var instance = Dio();
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      print('REQUEST[${options.method}] => PATH: ${options.path}');
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print(
          'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    }
    super.onResponse(response, handler);
  }

  @override
  onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print(
          'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    }
    return super.onError(err, handler);
  }
}
