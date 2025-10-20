import 'dart:io';

import 'package:dio/dio.dart';

import 'package:flutter_custom_widget_docs/network/model/common/result.dart';
import 'package:flutter_custom_widget_docs/utils/logger.dart';

// ignore: camel_case_types
typedef executeApiResponse<T> = XResult<T> Function(Response response);

class BaseRepository {
  Future<XResult<T>> executeApi<T>({
    required Function() func,
    required executeApiResponse<T> onSuccess,
  }) async {
    try {
      Response response = await func();
      final code = response.statusCode ?? 0;
      if (code >= HttpStatus.ok && code < HttpStatus.badRequest) {
        return onSuccess(response);
      } else {
        return XResult.responseError(response.data ?? {}, statusCode: code);
      }
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      Log.e('>>DioError: $e');
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      return XResult.responseError(
        (e.response?.data is Map)
            ? e.response?.data ?? {}
            : {'message': e.response?.data ?? ''},
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      Log.e('>>DioException: $e');
      return XResult.exception(e);
    }
  }
}
