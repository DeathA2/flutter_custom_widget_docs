import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class XResult<T> {
  T? data;
  String? error;
  int? statusCode;
  static String get unknownError => "SCore.text.error_unknown";
  bool get isError => error != null;
  bool get isSuccess => !isError;

  String get errorText {
    return error ?? unknownError;
  }

  XResult.success(this.data) {
    error = null;
  }
  XResult.error(String? error) {
    data = null;
    this.error = error ?? '';
  }

  XResult.responseError(
    Map<String, dynamic> responseData, {
    this.statusCode,
    String? defaultError,
  }) {
    data = null;
    try {
      error = responseData['message'] ?? unknownError;
    } catch (e) {
      error = unknownError;
    }
  }

  XResult.exception(Object? e) {
    data = null;
    if (e is PlatformException) {
      error = e.message;
    } else if (e is AssertionError) {
      error = e.message?.toString();
    } else if (e is FlutterError) {
      error = e.message;
    }
    error ??= unknownError;
  }
}
