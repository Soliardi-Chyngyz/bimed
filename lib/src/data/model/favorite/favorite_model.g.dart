// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FavoriteModel _$$_FavoriteModelFromJson(Map<String, dynamic> json) =>
    _$_FavoriteModel(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String?,
      price: json['price'] as int?,
      inCart: json['in_card'] as bool?,
      countInCart: json['count_in_card'] as int?,
      inFavorite: json['in_favorite'] as bool?,
      byPrescription: json['by_prescription'] as bool? ?? false,
      productType: json['product_type'] as String,
      cartItemId: json['cart_item_id'] as int?,
    );

Map<String, dynamic> _$$_FavoriteModelToJson(_$_FavoriteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'price': instance.price,
      'in_card': instance.inCart,
      'count_in_card': instance.countInCart,
      'in_favorite': instance.inFavorite,
      'by_prescription': instance.byPrescription,
      'product_type': instance.productType,
      'cart_item_id': instance.cartItemId,
    };
