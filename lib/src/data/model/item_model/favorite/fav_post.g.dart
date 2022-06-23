// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fav_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FavoritePostModel _$$_FavoritePostModelFromJson(Map<String, dynamic> json) =>
    _$_FavoritePostModel(
      id: json['id'] as int?,
      user: json['user'] as int?,
      product:
          (json['product'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$_FavoritePostModelToJson(
        _$_FavoritePostModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'product': instance.product,
    };
