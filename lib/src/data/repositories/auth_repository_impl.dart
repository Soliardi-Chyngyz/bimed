import 'dart:convert';
import 'dart:io';
import 'package:bimed/src/core/resources/data_state.dart';
import 'package:bimed/src/core/utils/constants.dart';
import 'package:bimed/src/data/api/auth_api.dart';
import 'package:bimed/src/data/model/auth_confirm_model/auth_confirm.dart';
import 'package:bimed/src/data/model/auth_model/auth_models.dart';
import 'package:bimed/src/data/model/auth_response_model/reg_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import '../../core/extenstions/response_extenstion.dart';
import '../network/dio_service.dart';

enum AuthStatus { unknown, done, error }

class AuthRepositoryImpl {
  final AuthAPI _api;

  AuthRepositoryImpl(this._api);

  Future<DataState<RegisterResponseModel, String>> postRegister(
      AuthModel model) async {
    final response = await http.post(
      Uri.parse('$apiFullBaseUrl/auth/register/'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      },
      body: jsonEncode(<String, String>{
        'phone': model.phone,
        'first_name': model.firstName,
        'last_name': model.lastName,
        'birthday': model.birthday
      }),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      response.body;
      Map<String, dynamic> value = json.decode(utf8.decode(response.bodyBytes));
      return DataSuccess(RegisterResponseModel.fromJson(value));
    } else if (response.statusCode == 400) {
      final v = json.decode(utf8.decode(response.bodyBytes));
      final s = v['phone'][0];
      return DataFailed(s);
    } else {
      throw Exception('Произошла ошибка');
    }
  }

  Future<DataState<String, DioError>> smsRequest(String phone) async {
    try {
      final httpResponse = await _api.getSmsCode(
          phone: AuthModel(phone: phone, birthday: 'birthday'));

      if (httpResponse.response.statusCode == HttpStatus.ok ||
          httpResponse.response.statusCode == HttpStatus.created) {
        return DataSuccess(httpResponse.data.message);
      }
      throw Exception();
    } on DioError catch (e) {
      if (e.response!.statusCode! >= 400 && e.response!.statusCode! <= 410) {
        final map = e.response!.data as Map;
        final key = map.keys.elementAt(0);
        final error = map[key];
        return DataFailed(
          DioError(
            error: error,
            response: e.response,
            requestOptions: e.response!.requestOptions,
            type: DioErrorType.response,
          ),
        );
      }
      return DataFailed(e);
    }
  }

  Future<DataState<RegisterResponseModel, DioError>> authConfirm(
      AuthConfirmModel model) async {
    try {
      final response = await _api.authConfirm(model: model);

      if (response.response.statusCode == HttpStatus.ok ||
          response.response.statusCode == HttpStatus.created) {
        return DataSuccess(response.data);
      }

      throw Exception();
    } on DioError catch (e) {
      if (e.response!.statusCode! >= 400 && e.response!.statusCode! <= 410) {
        final responseError = e.response?.data['message'];
        return DataFailed(
          DioError(
            error: responseError,
            response: e.response,
            requestOptions: e.response!.requestOptions,
            type: DioErrorType.response,
          ),
        );
      }
      return DataFailed(e);
    }
  }
}
