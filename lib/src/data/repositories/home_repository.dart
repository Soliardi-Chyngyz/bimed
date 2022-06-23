import 'package:bimed/src/core/extenstions/db_list.dart';
import 'package:bimed/src/data/db/db_helper.dart';
import 'package:bimed/src/data/model/home/news/news_model.dart';
import 'package:bimed/src/data/model/home/promotions_model.dart';
import 'package:bimed/src/data/model/home/slider_model.dart';
import 'package:bimed/src/data/network/dio_service.dart';
import 'package:dio/dio.dart';

import '../../core/extenstions/response_extenstion.dart';
import '../../core/resources/data_state.dart';
import '../../core/utils/preference/preference.dart';
import '../model/favorite/favorite_model.dart';
import '../model/home/hits/hit_model.dart';

class HomeRepository {
  final DioService _dioService;

  HomeRepository(this._dioService);

  isAuth() async {
    final isAuth = await Prefs().isAuthorized();
    return isAuth;
  }

  Future<DataState<List<SliderModel>, DioError>> getSliders() async {
    final Response response =
        await _dioService.getRequest(endPoint: '/main/slides/');

    final resStatus = responseState(response, false);
    switch (resStatus) {
      case StateResponse.success:
        {
          final list = (response.data as List)
              .map((i) => SliderModel.fromJson(i))
              .toList();
          return DataSuccess(list);
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

  Future<DataState<PromotionsModel, DioError>> getPromotions() async {
    final Response response = await _dioService
        .getRequest(endPoint: '/main/stocks/', query: {'page': 1});

    final resStatus = responseState(response, false);
    switch (resStatus) {
      case StateResponse.success:
        {
          final data = PromotionsModel.fromJson(response.data);
          return DataSuccess(data);
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

  Future<DataState<NewsModel, DioError>> getNews() async {
    final Response response = await _dioService
        .getRequest(endPoint: '/main/promos/mainpage/', query: {'page': 1});

    final resStatus = responseState(response, false);
    switch (resStatus) {
      case StateResponse.success:
        {
          final data = NewsModel.fromJson(response.data);
          return DataSuccess(data);
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

  Future<DataState<HitModel, DioError>> getHits() async {
    final Response response =
        await _dioService.getRequest(endPoint: '/main/main-bestsellers/');

    final resStatus = responseState(response, false);
    switch (resStatus) {
      case StateResponse.success:
        {
          final isA = await isAuth();
          final data = HitModel.fromJson(response.data);
          if (!isA) {
            final sortedData = await databaseSortedList(data.results);
            if (sortedData == null) {
              return DataSuccess(data);
            } else {
              return DataSuccess(HitModel(
                  count: data.count,
                  results: sortedData,
                  previous: data.previous,
                  next: data.next,
                  numPage: data.numPage));
            }
          } else {
            return DataSuccess(data);
          }
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

  Future<DataState<bool, DioError>> getNotifications() async {
    final Response response = await _dioService
        .getRequest(endPoint: '/notification/notification/');

    final resStatus = responseState(response, false);
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
}
