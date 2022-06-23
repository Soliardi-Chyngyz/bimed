// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewsItemModel _$$_NewsItemModelFromJson(Map<String, dynamic> json) =>
    _$_NewsItemModel(
      id: json['id'] as int?,
      title: json['title'] as String,
      gallery: json['gallery'] as String?,
      description: json['get_short_description'] as String?,
      publicDate: json['publication_date'] as String,
    );

Map<String, dynamic> _$$_NewsItemModelToJson(_$_NewsItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'gallery': instance.gallery,
      'get_short_description': instance.description,
      'publication_date': instance.publicDate,
    };
