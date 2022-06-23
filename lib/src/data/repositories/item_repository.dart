import 'package:bimed/src/data/db/db_helper.dart';
import 'package:bimed/src/data/model/contact/contacts.dart';
import 'package:bimed/src/data/model/favorite/favorite_model.dart';
import 'package:bimed/src/data/model/item_detail_info.dart';
import 'package:bimed/src/data/network/dio_service.dart';
import 'package:dio/dio.dart';

import '../../core/extenstions/db_list.dart';
import '../../core/extenstions/response_extenstion.dart';
import '../../core/resources/data_state.dart';
import '../../core/utils/preference/preference.dart';
import '../model/category_model/response_category/result_model.dart';

enum DataType { database, remote }

class ItemRepository {
  final DioService _dioService;

  ItemRepository(this._dioService);

  Future<DataState<ResultModel, DioError>> getResult(
      Map<String, dynamic> map) async {
    final Response response =
        await _dioService.getRequest(endPoint: '/products/', query: map);

    final resStatus = responseState(response, false);
    switch (resStatus) {
      case StateResponse.success:
        {
          final isA = await isAuth();
          final data = ResultModel.fromJson(response.data);
          if (!isA) {
            final sortedData = await databaseSortedList(data.results);
            if (sortedData == null) {
              return DataSuccess(data);
            } else {
              return DataSuccess(ResultModel(
                  count: data.count,
                  previous: data.previous,
                  next: data.next,
                  numPage: data.numPage,
                  results: sortedData));
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

  isAuth() async {
    final isAuth = await Prefs().isAuthorized();
    return isAuth;
  }

  Future<DataState<DataType, DioError>> setFavoriteUnfavorite(
      ItemModel model) async {
    final isA = await isAuth();
    if (isA) {
      final map = {
        'product': [model.id]
      };
      final Response response =
          await _dioService.postHTTP(endPoint: '/favorites/', data: map);

      final resStatus = responseState(response, false);
      switch (resStatus) {
        case StateResponse.success:
          {
            return const DataSuccess(DataType.remote);
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
    } else {
      var fav = 1;
      if (model.inFavorite == true) fav = 0;
      await DBHelper.insert({
        'id': model.id,
        'countInCart': model.countInCart ?? 0,
        'inFavorite': fav,
        'image': model.image ?? '',
        'title': model.name,
        'price': model.price ?? 0
      });
      return const DataSuccess(DataType.database);
    }
  }

  Future<DataState<DataType, DioError>> decrementCart(ItemModel model) async {
    final isA = await isAuth();
    if (isA) {
      final Response response = await _dioService
          .postHTTP(endPoint: '/cart/decrement/', data: {'product': model.id});

      final resStatus = responseState(response, false);
      switch (resStatus) {
        case StateResponse.success:
          {
            return const DataSuccess(DataType.remote);
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
    } else {
      var fav = 0;
      if (model.inFavorite == true) fav = 1;
      if (model.countInCart == 1) {
        await DBHelper.delete(model.id);
      } else {
        await DBHelper.insert({
          'id': model.id,
          'countInCart': model.countInCart! - 1,
          'inFavorite': fav,
          'image': model.image ?? '',
          'title': model.name,
          'price': model.price ?? 0
        });
      }
      return const DataSuccess(DataType.database);
    }
  }

  Future<DataState<DataType, DioError>> incrementCart(ItemModel model) async {
    final isA = await isAuth();
    if (isA) {
      final Response response = await _dioService
          .postHTTP(endPoint: '/cart/increment/', data: {'product': model.id});

      final resStatus = responseState(response, false);
      switch (resStatus) {
        case StateResponse.success:
          {
            return const DataSuccess(DataType.remote);
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
    } else {
      var fav = 0;
      if (model.inFavorite == true) fav = 1;
      await DBHelper.insert({
        'id': model.id,
        'countInCart': model.countInCart! + 1,
        'inFavorite': fav,
        'image': model.image ?? '',
        'title': model.name,
        'price': model.price ?? 0
      });
      return const DataSuccess(DataType.database);
    }
  }

  Future<DataState<DataType, DioError>> addToCart(ItemModel model) async {
    final isA = await isAuth();
    if (isA) {
      final map = {
        'product_item': [
          {'product': model.id, 'nums': 1}
        ]
      };
      final Response response =
          await _dioService.postHTTP(endPoint: '/cart/', data: map);

      final resStatus = responseState(response, false);
      switch (resStatus) {
        case StateResponse.success:
          {
            return const DataSuccess(DataType.remote);
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
    } else {
      var fav = 0;
      if (model.inFavorite == true) fav = 1;
      await DBHelper.insert({
        'id': model.id,
        'countInCart': 1,
        'inFavorite': fav,
        'image': model.image ?? '',
        'title': model.name,
        'price': model.price ?? 0
      });
      return const DataSuccess(DataType.database);
    }
  }

  Future<DataState<bool, DioError>> removeFromCart(int id) async {
    final isA = await isAuth();

    if (isA) {
      final Response response =
          await _dioService.deleteHTTP(endPoint: '/cart/$id/');

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
    } else {
      await DBHelper.delete(id);
      return const DataSuccess(true);
    }
  }

  Future<DataState<ItemDetailModel, DioError>> getDetailInfo(int id) async {
    final Response response =
        await _dioService.getRequest(endPoint: '/products/$id');

    final resStatus = responseState(response, false);
    switch (resStatus) {
      case StateResponse.success:
        {
          final isA = await isAuth();
          final data = ItemDetailModel.fromJson(response.data);
          if (!isA) {
            if (data.similarProducts != null &&
                data.similarProducts?.isNotEmpty == true) {
              final sortedData =
                  await databaseSortedList(data.similarProducts!);
              if (sortedData == null) {
                return DataSuccess(data);
              } else {
                data.similarProducts = sortedData;
                return DataSuccess(data);
              }
            } else {
              return DataSuccess(data);
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

  Future<DataState<Contacts, DioError>> getContacts() async {
    final Response response =
        await _dioService.getRequest(endPoint: '/main/contacts-footer/');

    final resStatus = responseState(response, false);
    switch (resStatus) {
      case StateResponse.success:
        {
          return DataSuccess(Contacts.fromJson(response.data));
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

  /*Future<DataState<ItemModel, DioError>> getItemState(int id) async {
    final isA = await isAuth();
    if (isA) {
    final Response response =
    await _dioService.getRequest(endPoint: '/products/product-info/$id/');

    final resStatus = responseState(response, false);
    switch (resStatus) {
      case StateResponse.success:
        {
          return DataSuccess(ItemModel.fromJson(response.data));
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
    } else {

    }
  }*/
}
