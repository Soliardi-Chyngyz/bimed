// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'under_promotions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnderPromModel _$$_UnderPromModelFromJson(Map<String, dynamic> json) =>
    _$_UnderPromModel(
      id: json['id'] as int?,
      image: json['image'] as String?,
      product: ItemModel.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UnderPromModelToJson(_$_UnderPromModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'product': instance.product,
    };
