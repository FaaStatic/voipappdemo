import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiLogging extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print(err);
    }
    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      print(options.data);
      print(options.headers);
      print(options.path);
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print(response.statusCode);
      print(response.data);
      print(response.statusMessage);
    }
    super.onResponse(response, handler);
  }
}
