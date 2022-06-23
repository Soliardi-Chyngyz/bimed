import 'package:bimed/src/data/model/cart.dart';
import 'package:bimed/src/data/model/category_model/category_model.dart';
import 'package:bimed/src/data/model/favorite/image_model.dart';
import 'package:bimed/src/data/model/order_model/order_model.dart';
import 'package:bimed/src/data/network/dio_service.dart';
import 'package:dio/dio.dart';

import '../../core/extenstions/response_extenstion.dart';
import '../../core/resources/data_state.dart';
import '../../core/utils/preference/preference.dart';
import '../db/db_helper.dart';
import '../model/favorite/favorite_model.dart';

class CategoryRepository {
  final DioService _dioService;

  CategoryRepository(this._dioService);

  isAuth() async {
    final isAuth = await Prefs().isAuthorized();
    return isAuth;
  }

  Future<DataState<List<CategoryItem>, DioError>> getCategories() async {
    final Response response =
        await _dioService.getRequest(endPoint: '/products/category/');

    final resStatus = responseState(response, false);
    switch (resStatus) {
      case StateResponse.success:
        {
          final list = (response.data as List)
              .map((i) => CategoryItem.fromJson(i))
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

  Future<DataState<CartModel, DioError>> getCart() async {
    final isA = await isAuth();
    if (isA) {
      final Response response =
          await _dioService.getRequest(endPoint: '/cart/mycart/');

      final resStatus = responseState(response, false);
      switch (resStatus) {
        case StateResponse.success:
          {
            return DataSuccess(CartModel.fromJson(response.data));
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
      final cartList = await databaseCartList();
      return DataSuccess(cartList);
    }
  }

  Future<CartModel?> databaseCartList() async {
    final dbList = await DBHelper.getData();
    if (dbList.isEmpty) return null;

    final itemDBModelList = dbList
        .map((e) => ItemDBModel(e['id'], e['countInCart'], e['inFavorite'],
            title: e['title'], image: e['image'], price: e['price']))
        .toList();
    if (itemDBModelList.isEmpty) return null;

    int productCount = 0;
    int totalAmount = 0;
    int totalAmountCost = 0;

    final List<ItemModel> itemList = [];
    for (var element in itemDBModelList) {
      if (element.countInCart > 0) {
        itemList.add(ItemModel(
                id: element.id,
                name: element.title ?? '',
                productType: '',
                image: element.image,
                price: element.price,
                countInCart: element.countInCart,
                inFavorite: element.inFavorite == 0 ? false : true));
        productCount++;
        final price = element.price ?? 0;
        final cost = price * element.countInCart;
        totalAmountCost += cost;
      }
    }
    if (itemList.isEmpty) return null;

    return CartModel(
        totalAmountProduct: totalAmount,
        productCount: productCount,
        product: itemList,
        totalAmountCost: totalAmountCost
    );
  }


  Future<DataState<bool, DioError>> makeOrder(OrderModel model) async {
    final Response response =
    await _dioService.postHTTP(endPoint: '/cart/', data: model);

    final resStatus = responseState(response, false);
    switch (resStatus) {
      case StateResponse.success:
        {
          // OrderModel.fromJson(response.data);

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
