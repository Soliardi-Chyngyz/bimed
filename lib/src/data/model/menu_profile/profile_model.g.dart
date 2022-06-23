// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProfileModel _$$_ProfileModelFromJson(Map<String, dynamic> json) =>
    _$_ProfileModel(
      name: json['first_name'] as String,
      surname: json['last_name'] as String,
      gender: json['gender'] as String,
      birthday: json['birthday'] as String,
      phone: json['whats_app_phone'] as String,
      avatar: json['avatar'] as String?,
      id: json['id'] as int?,
      points: json['points'] as String?,
      qrKey: json['qr_key'] as String?,
      qrPhoto: json['qr_code_file'] as String?,
      unreadNotifExists: json['unread_notifications_exists'] as bool? ?? false,
      unreadNotifCount: json['unread_notifications_count'] as int?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      userTypeDisplay: json['get_user_type_display'] as String?,
      isBlock: json['is_block'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ProfileModelToJson(_$_ProfileModel instance) =>
    <String, dynamic>{
      'first_name': instance.name,
      'last_name': instance.surname,
      'gender': instance.gender,
      'birthday': instance.birthday,
      'whats_app_phone': instance.phone,
      'avatar': instance.avatar,
      'id': instance.id,
      'points': instance.points,
      'qr_key': instance.qrKey,
      'qr_code_file': instance.qrPhoto,
      'unread_notifications_exists': instance.unreadNotifExists,
      'unread_notifications_count': instance.unreadNotifCount,
      'email': instance.email,
      'address': instance.address,
      'get_user_type_display': instance.userTypeDisplay,
      'is_block': instance.isBlock,
    };
