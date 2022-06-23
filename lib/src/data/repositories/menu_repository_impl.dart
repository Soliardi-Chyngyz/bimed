import 'dart:io';
import 'package:bimed/src/core/extenstions/response_extenstion.dart';
import 'package:bimed/src/data/model/avatar_model/avatar_model.dart';
import 'package:bimed/src/data/model/favorite/favorite_model.dart';
import 'package:bimed/src/data/network/dio_service.dart';
import 'package:dio/dio.dart';
import 'package:bimed/src/core/resources/data_state.dart';
import 'package:bimed/src/data/model/menu_profile/profile_model.dart';

class MenuRepository {
  final DioService _dioService;

  MenuRepository(this._dioService);

  Future<DataState<bool, DioError>> removeFavorite(int id) async {
    final Response response = await _dioService.deleteHTTP(endPoint: '/favorites/$id/');

    final resStatus = responseState(response);
    switch (resStatus) {
      case StateResponse.success:
        {
          return const DataSuccess(true);
        }
      case StateResponse.error:
        {
          throw Exception();
        }
      default:
        {
          return DataFailed(resStatus as DioError);
        }
    }
  }


  Future<DataState<FavoritesList, DioError>> getFavoriteItems(bool isShow) async {
    final Response response = await _dioService.getRequest(endPoint: '/favorites');

    final resStatus = responseState(response, isShow);
    switch (resStatus) {
      case StateResponse.success:
        {
          final list = (response.data as List).map((i) =>
              ItemModel.fromJson(i)).toList();

          return DataSuccess(FavoritesList(list));
        }
      case StateResponse.error:
        {
          throw Exception();
        }
      default:
        {
          return DataFailed(resStatus as DioError);
        }
    }
  }

  Future<DataState<ProfileModel, DioError>> getProfile() async {
    final Response response =
        await _dioService.getRequest(endPoint: '/auth/profile/');

    final resStatus = responseState(response, false);
    switch (resStatus) {
      case StateResponse.success:
        {
          return DataSuccess(ProfileModel.fromJson(response.data));
        }
      case StateResponse.error:
        {
          throw Exception();
        }
      default:
        {
          return DataFailed(resStatus as DioError);
        }
    }
  }

  Future<DataState<ProfileModel, DioError>> changeProfile(
      ProfileModel model) async {
    final Response response = await _dioService.putHTTP(
        endPoint: '/auth/update-profile/', data: model);

    final responseStatus = responseState(response);
    if (responseStatus == StateResponse.success) {
      return DataSuccess(ProfileModel.fromJson(response.data));
    } else if (responseStatus == StateResponse.error) {
      throw Exception();
    } else {
      return DataFailed(responseStatus as DioError);
    }
  }

  Future<DataState<AvatarModel, DioError>> setAvatar(File file) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "avatar": await MultipartFile.fromFile(file.path, filename: fileName),
    });
    final Response response = await _dioService.putHTTP(
        endPoint: '/auth/update-avatar/', data: formData);

    final responseStatus = responseState(response);

    if (responseStatus == StateResponse.success) {
      return DataSuccess(AvatarModel.fromJson(response.data));
    } else if (responseStatus == StateResponse.error) {
      throw Exception();
    } else {
      return DataFailed(responseStatus as DioError);
    }
  }
}
