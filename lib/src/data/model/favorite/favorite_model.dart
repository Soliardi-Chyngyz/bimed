import 'package:bimed/src/data/model/favorite/item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_model.freezed.dart';
part 'favorite_model.g.dart';

@freezed
class ItemModel extends ItemM with _$ItemModel{

  factory ItemModel(
          {required int id,
          required String name,
          String? image,
          int? price,
          @JsonKey(name: 'in_card') bool? inCart,
          @JsonKey(name: 'count_in_card') int? countInCart,
          @JsonKey(name: 'in_favorite') bool? inFavorite,
          @Default(false) @JsonKey(name: 'by_prescription') bool byPrescription,
          @JsonKey(name: 'product_type') required String productType,
          @JsonKey(name: 'cart_item_id') int? cartItemId,
          }) =
      _FavoriteModel;

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class FavoritesList with _$FavoritesList {
  factory FavoritesList(List<ItemModel> list) = _FavoritesList;
}
