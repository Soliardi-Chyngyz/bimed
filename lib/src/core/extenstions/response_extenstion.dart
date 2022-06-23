

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

Object responseState<T>(Response response, [isLoadingShow = true]) {
  if (response.statusCode == HttpStatus.ok ||
      response.statusCode == HttpStatus.created ||
      response.statusCode == HttpStatus.nonAuthoritativeInformation ||
      response.statusCode == HttpStatus.noContent) {
    if (isLoadingShow) {
      EasyLoading.showSuccess('Успешно');
    }
    return StateResponse.success;
  } else if (response.statusCode! >= 400 && response.statusCode! <= 410) {
    final map = response.data as Map;
    final key = map.keys.elementAt(0);
    final error = map[key];
    EasyLoading.showError(error ?? 'Ошибка');
    return DioError(
      error: error,
      response: response,
      requestOptions: response.requestOptions,
      type: DioErrorType.response,
    );
  } else {
    EasyLoading.dismiss();
    return StateResponse.error;
  }
}

enum StateResponse {
  success,
  error
}
