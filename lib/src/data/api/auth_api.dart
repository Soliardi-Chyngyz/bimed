import 'package:bimed/src/data/model/auth_confirm_model/auth_confirm.dart';
import 'package:bimed/src/data/model/auth_model/auth_models.dart';
import 'package:bimed/src/data/model/auth_response_model/auth_response_model.dart';
import 'package:bimed/src/data/model/auth_response_model/reg_response_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../core/utils/constants.dart';
part 'auth_api.g.dart';

@RestApi(baseUrl: apiFullBaseUrl)
abstract class AuthAPI {
  factory AuthAPI(Dio dio, {String baseUrl}) = _AuthAPI;

  @POST('/auth/login-authenticate/')
  Future<HttpResponse<AuthResponseModel>> getSmsCode({
    @Body() AuthModel phone,
  });

  @POST('/auth/login-confirm/')
  Future<HttpResponse<RegisterResponseModel>> authConfirm(
      {@Body() AuthConfirmModel model});
}
