// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageModel _$ImageModelFromJon(Map<String, dynamic> json) => ImageModel(
      id: json['id'] as int?,
      isLogo: json['is_logo'] as bool?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_logo': instance.isLogo,
      'image': instance.image,
    };

_$_ImageModel _$$_ImageModelFromJson(Map<String, dynamic> json) =>
    _$_ImageModel(
      id: json['id'] as int?,
      isLogo: json['is_logo'] as bool?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$_ImageModelToJson(_$_ImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_logo': instance.isLogo,
      'image': instance.image,
    };
