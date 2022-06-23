import '../../data/db/db_helper.dart';
import '../../data/model/favorite/favorite_model.dart';
import 'package:collection/collection.dart';

Future<List<ItemModel>?> databaseSortedList(List<ItemModel> list) async {
  final dbList = await DBHelper.getData();
  final List<ItemModel> newList = [];

  if (dbList.isEmpty) return null;

  final dBlist = dbList
      .map((e) =>
      ItemDBModel(e['id'], e['countInCart'], e['inFavorite']))
      .toList();

  for (var element in list) {
    final ItemDBModel? e =
    dBlist.firstWhereOrNull((e) => e.id == element.id);
    if (e != null) {
      newList.add(ItemModel(
          id: element.id,
          name: element.name,
          image: element.image,
          price: element.price,
          inCart: element.inCart,
          countInCart: e.countInCart,
          inFavorite: e.inFavorite == 0 ? false : true,
          byPrescription: element.byPrescription,
          productType: element.productType));
    } else {
      newList.add(element);
    }
  }
  return newList;
}