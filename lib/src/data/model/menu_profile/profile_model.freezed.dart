// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return _ProfileModel.fromJson(json);
}

/// @nodoc
mixin _$ProfileModel {
  @JsonKey(name: 'first_name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get surname => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get birthday => throw _privateConstructorUsedError;
  @JsonKey(name: 'whats_app_phone')
  String get phone => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get points => throw _privateConstructorUsedError;
  @JsonKey(name: 'qr_key')
  String? get qrKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'qr_code_file')
  String? get qrPhoto => throw _privateConstructorUsedError;
  @JsonKey(name: 'unread_notifications_exists')
  bool get unreadNotifExists => throw _privateConstructorUsedError;
  @JsonKey(name: 'unread_notifications_count')
  int? get unreadNotifCount => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'get_user_type_display')
  String? get userTypeDisplay => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_block')
  bool get isBlock => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileModelCopyWith<ProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileModelCopyWith<$Res> {
  factory $ProfileModelCopyWith(
          ProfileModel value, $Res Function(ProfileModel) then) =
      _$ProfileModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'first_name') String name,
      @JsonKey(name: 'last_name') String surname,
      String gender,
      String birthday,
      @JsonKey(name: 'whats_app_phone') String phone,
      String? avatar,
      int? id,
      String? points,
      @JsonKey(name: 'qr_key') String? qrKey,
      @JsonKey(name: 'qr_code_file') String? qrPhoto,
      @JsonKey(name: 'unread_notifications_exists') bool unreadNotifExists,
      @JsonKey(name: 'unread_notifications_count') int? unreadNotifCount,
      String? email,
      String? address,
      @JsonKey(name: 'get_user_type_display') String? userTypeDisplay,
      @JsonKey(name: 'is_block') bool isBlock});
}

/// @nodoc
class _$ProfileModelCopyWithImpl<$Res> implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._value, this._then);

  final ProfileModel _value;
  // ignore: unused_field
  final $Res Function(ProfileModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? surname = freezed,
    Object? gender = freezed,
    Object? birthday = freezed,
    Object? phone = freezed,
    Object? avatar = freezed,
    Object? id = freezed,
    Object? points = freezed,
    Object? qrKey = freezed,
    Object? qrPhoto = freezed,
    Object? unreadNotifExists = freezed,
    Object? unreadNotifCount = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? userTypeDisplay = freezed,
    Object? isBlock = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      surname: surname == freezed
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: birthday == freezed
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      points: points == freezed
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as String?,
      qrKey: qrKey == freezed
          ? _value.qrKey
          : qrKey // ignore: cast_nullable_to_non_nullable
              as String?,
      qrPhoto: qrPhoto == freezed
          ? _value.qrPhoto
          : qrPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      unreadNotifExists: unreadNotifExists == freezed
          ? _value.unreadNotifExists
          : unreadNotifExists // ignore: cast_nullable_to_non_nullable
              as bool,
      unreadNotifCount: unreadNotifCount == freezed
          ? _value.unreadNotifCount
          : unreadNotifCount // ignore: cast_nullable_to_non_nullable
              as int?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      userTypeDisplay: userTypeDisplay == freezed
          ? _value.userTypeDisplay
          : userTypeDisplay // ignore: cast_nullable_to_non_nullable
              as String?,
      isBlock: isBlock == freezed
          ? _value.isBlock
          : isBlock // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ProfileModelCopyWith<$Res>
    implements $ProfileModelCopyWith<$Res> {
  factory _$ProfileModelCopyWith(
          _ProfileModel value, $Res Function(_ProfileModel) then) =
      __$ProfileModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'first_name') String name,
      @JsonKey(name: 'last_name') String surname,
      String gender,
      String birthday,
      @JsonKey(name: 'whats_app_phone') String phone,
      String? avatar,
      int? id,
      String? points,
      @JsonKey(name: 'qr_key') String? qrKey,
      @JsonKey(name: 'qr_code_file') String? qrPhoto,
      @JsonKey(name: 'unread_notifications_exists') bool unreadNotifExists,
      @JsonKey(name: 'unread_notifications_count') int? unreadNotifCount,
      String? email,
      String? address,
      @JsonKey(name: 'get_user_type_display') String? userTypeDisplay,
      @JsonKey(name: 'is_block') bool isBlock});
}

/// @nodoc
class __$ProfileModelCopyWithImpl<$Res> extends _$ProfileModelCopyWithImpl<$Res>
    implements _$ProfileModelCopyWith<$Res> {
  __$ProfileModelCopyWithImpl(
      _ProfileModel _value, $Res Function(_ProfileModel) _then)
      : super(_value, (v) => _then(v as _ProfileModel));

  @override
  _ProfileModel get _value => super._value as _ProfileModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? surname = freezed,
    Object? gender = freezed,
    Object? birthday = freezed,
    Object? phone = freezed,
    Object? avatar = freezed,
    Object? id = freezed,
    Object? points = freezed,
    Object? qrKey = freezed,
    Object? qrPhoto = freezed,
    Object? unreadNotifExists = freezed,
    Object? unreadNotifCount = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? userTypeDisplay = freezed,
    Object? isBlock = freezed,
  }) {
    return _then(_ProfileModel(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      surname: surname == freezed
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: birthday == freezed
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      points: points == freezed
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as String?,
      qrKey: qrKey == freezed
          ? _value.qrKey
          : qrKey // ignore: cast_nullable_to_non_nullable
              as String?,
      qrPhoto: qrPhoto == freezed
          ? _value.qrPhoto
          : qrPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      unreadNotifExists: unreadNotifExists == freezed
          ? _value.unreadNotifExists
          : unreadNotifExists // ignore: cast_nullable_to_non_nullable
              as bool,
      unreadNotifCount: unreadNotifCount == freezed
          ? _value.unreadNotifCount
          : unreadNotifCount // ignore: cast_nullable_to_non_nullable
              as int?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      userTypeDisplay: userTypeDisplay == freezed
          ? _value.userTypeDisplay
          : userTypeDisplay // ignore: cast_nullable_to_non_nullable
              as String?,
      isBlock: isBlock == freezed
          ? _value.isBlock
          : isBlock // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProfileModel implements _ProfileModel {
  _$_ProfileModel(
      {@JsonKey(name: 'first_name')
          required this.name,
      @JsonKey(name: 'last_name')
          required this.surname,
      required this.gender,
      required this.birthday,
      @JsonKey(name: 'whats_app_phone')
          required this.phone,
      this.avatar,
      this.id,
      this.points,
      @JsonKey(name: 'qr_key')
          this.qrKey,
      @JsonKey(name: 'qr_code_file')
          this.qrPhoto,
      @JsonKey(name: 'unread_notifications_exists')
          this.unreadNotifExists = false,
      @JsonKey(name: 'unread_notifications_count')
          this.unreadNotifCount,
      this.email,
      this.address,
      @JsonKey(name: 'get_user_type_display')
          this.userTypeDisplay,
      @JsonKey(name: 'is_block')
          this.isBlock = false});

  factory _$_ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileModelFromJson(json);

  @override
  @JsonKey(name: 'first_name')
  final String name;
  @override
  @JsonKey(name: 'last_name')
  final String surname;
  @override
  final String gender;
  @override
  final String birthday;
  @override
  @JsonKey(name: 'whats_app_phone')
  final String phone;
  @override
  final String? avatar;
  @override
  final int? id;
  @override
  final String? points;
  @override
  @JsonKey(name: 'qr_key')
  final String? qrKey;
  @override
  @JsonKey(name: 'qr_code_file')
  final String? qrPhoto;
  @override
  @JsonKey(name: 'unread_notifications_exists')
  final bool unreadNotifExists;
  @override
  @JsonKey(name: 'unread_notifications_count')
  final int? unreadNotifCount;
  @override
  final String? email;
  @override
  final String? address;
  @override
  @JsonKey(name: 'get_user_type_display')
  final String? userTypeDisplay;
  @override
  @JsonKey(name: 'is_block')
  final bool isBlock;

  @override
  String toString() {
    return 'ProfileModel(name: $name, surname: $surname, gender: $gender, birthday: $birthday, phone: $phone, avatar: $avatar, id: $id, points: $points, qrKey: $qrKey, qrPhoto: $qrPhoto, unreadNotifExists: $unreadNotifExists, unreadNotifCount: $unreadNotifCount, email: $email, address: $address, userTypeDisplay: $userTypeDisplay, isBlock: $isBlock)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfileModel &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.surname, surname) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality().equals(other.birthday, birthday) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.points, points) &&
            const DeepCollectionEquality().equals(other.qrKey, qrKey) &&
            const DeepCollectionEquality().equals(other.qrPhoto, qrPhoto) &&
            const DeepCollectionEquality()
                .equals(other.unreadNotifExists, unreadNotifExists) &&
            const DeepCollectionEquality()
                .equals(other.unreadNotifCount, unreadNotifCount) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality()
                .equals(other.userTypeDisplay, userTypeDisplay) &&
            const DeepCollectionEquality().equals(other.isBlock, isBlock));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(surname),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(birthday),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(avatar),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(points),
      const DeepCollectionEquality().hash(qrKey),
      const DeepCollectionEquality().hash(qrPhoto),
      const DeepCollectionEquality().hash(unreadNotifExists),
      const DeepCollectionEquality().hash(unreadNotifCount),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(userTypeDisplay),
      const DeepCollectionEquality().hash(isBlock));

  @JsonKey(ignore: true)
  @override
  _$ProfileModelCopyWith<_ProfileModel> get copyWith =>
      __$ProfileModelCopyWithImpl<_ProfileModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileModelToJson(this);
  }
}

abstract class _ProfileModel implements ProfileModel {
  factory _ProfileModel(
      {@JsonKey(name: 'first_name')
          required final String name,
      @JsonKey(name: 'last_name')
          required final String surname,
      required final String gender,
      required final String birthday,
      @JsonKey(name: 'whats_app_phone')
          required final String phone,
      final String? avatar,
      final int? id,
      final String? points,
      @JsonKey(name: 'qr_key')
          final String? qrKey,
      @JsonKey(name: 'qr_code_file')
          final String? qrPhoto,
      @JsonKey(name: 'unread_notifications_exists')
          final bool unreadNotifExists,
      @JsonKey(name: 'unread_notifications_count')
          final int? unreadNotifCount,
      final String? email,
      final String? address,
      @JsonKey(name: 'get_user_type_display')
          final String? userTypeDisplay,
      @JsonKey(name: 'is_block')
          final bool isBlock}) = _$_ProfileModel;

  factory _ProfileModel.fromJson(Map<String, dynamic> json) =
      _$_ProfileModel.fromJson;

  @override
  @JsonKey(name: 'first_name')
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'last_name')
  String get surname => throw _privateConstructorUsedError;
  @override
  String get gender => throw _privateConstructorUsedError;
  @override
  String get birthday => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'whats_app_phone')
  String get phone => throw _privateConstructorUsedError;
  @override
  String? get avatar => throw _privateConstructorUsedError;
  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get points => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'qr_key')
  String? get qrKey => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'qr_code_file')
  String? get qrPhoto => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'unread_notifications_exists')
  bool get unreadNotifExists => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'unread_notifications_count')
  int? get unreadNotifCount => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  String? get address => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'get_user_type_display')
  String? get userTypeDisplay => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'is_block')
  bool get isBlock => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProfileModelCopyWith<_ProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}
