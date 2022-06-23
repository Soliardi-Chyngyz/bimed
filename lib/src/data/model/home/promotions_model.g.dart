// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PromotionsModel _$$_PromotionsModelFromJson(Map<String, dynamic> json) =>
    _$_PromotionsModel(
      count: json['count'] as int,
      previous: json['previous'] as String?,
      next: json['next'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => UnderPromModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PromotionsModelToJson(_$_PromotionsModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'previous': instance.previous,
      'next': instance.next,
      'results': instance.results,
    };
