// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_confirm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthConfirmModel _$$_AuthConfirmModelFromJson(Map<String, dynamic> json) =>
    _$_AuthConfirmModel(
      phone: json['phone'] as String,
      confirmCode: json['confirmation_code'] as String,
    );

Map<String, dynamic> _$$_AuthConfirmModelToJson(_$_AuthConfirmModel instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'confirmation_code': instance.confirmCode,
    };
