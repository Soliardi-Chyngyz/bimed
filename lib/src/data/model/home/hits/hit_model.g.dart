// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HitModel _$$_HitModelFromJson(Map<String, dynamic> json) => _$_HitModel(
      count: json['count'] as int,
      previous: json['previous'] as String?,
      next: json['next'] as String?,
      numPage: json['num_pages'] as int?,
      results: (json['results'] as List<dynamic>)
          .map((e) => ItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_HitModelToJson(_$_HitModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'previous': instance.previous,
      'next': instance.next,
      'num_pages': instance.numPage,
      'results': instance.results,
    };
