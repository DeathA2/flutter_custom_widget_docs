import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_custom_widget_docs/utils/logger.dart';

class DioServices {
  static Dio dio = Dio();

  static void setAuthTokenDio(String accessToken) {
    dio = Dio(BaseOptions(headers: {'Authorization': 'Bearer $accessToken'}));
    // Listen dio request to log debug
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (options.data != null && !kDebugMode) {
            Log.i('[DIO] Request: ${options.data}');
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          if (!kDebugMode) {
            Log.i('[DIO] Response: ${response.data}');
          }
          return handler.next(response);
        },
        onError: (e, handler) {
          Log.w('[DIO] Error: ${e.message}');
          return handler.next(e);
        },
      ),
    );
    if (kDebugMode) {
      debugPrint('AccessToken: $accessToken');
    }
  }

  // static bool updateToken() {
  //   final String? accessToken = LocalStorage().getAccessToken();
  //   if (accessToken != null) {
  //     dio.options.headers['Authorization'] = 'Bearer $accessToken';
  //     xLog.f(accessToken);
  //     return true;
  //   }
  //   return false;
  // }

  static Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    int? timeout,
    String? token,
  }) {
    return dio.get(
      url,
      queryParameters: queryParameters,
      data: data,
      options: Options(
        headers: token == null ? null : {'Authorization': 'Bearer $token'},
      ),
    );
  }

  static Future<Response> post(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool ignoreToken = false,
    int? timeout,
    String? token,
  }) async {
    return await dio.post(
      url,
      queryParameters: queryParameters,
      data: data,
      options: Options(
        headers: token == null ? null : {'Authorization': 'Bearer $token'},
      ),
    );
  }

  static Future<Response> put(
    String url, {
    Object? data,
    bool ignoreToken = false,
    Map<String, dynamic>? queryParameters,
    int? timeout,
    String? token,
  }) {
    return dio.put(
      url,
      queryParameters: queryParameters,
      data: data,
      options: Options(
        headers: token == null ? null : {'Authorization': 'Bearer $token'},
      ),
    );
  }

  static Future<Response> patch(
    String url, {
    Object? data,
    bool ignoreToken = false,
    Map<String, dynamic>? queryParameters,
    int? timeout,
    String? token,
  }) {
    return dio.patch(
      url,
      queryParameters: queryParameters,
      data: data,
      options: Options(
        headers: token == null ? null : {'Authorization': 'Bearer $token'},
      ),
    );
  }

  static Future<Response> delete(
    String url, {
    bool ignoreToken = false,
    Map<String, dynamic>? queryParameters,
    Object? data,
    int? timeout,
    String? token,
  }) {
    return dio.delete(
      url,
      queryParameters: queryParameters,
      data: data,
      options: Options(
        headers: token == null ? null : {'Authorization': 'Bearer $token'},
      ),
    );
  }
}
