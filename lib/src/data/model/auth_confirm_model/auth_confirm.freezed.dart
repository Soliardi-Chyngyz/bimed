// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_confirm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthConfirmModel _$AuthConfirmModelFromJson(Map<String, dynamic> json) {
  return _AuthConfirmModel.fromJson(json);
}

/// @nodoc
mixin _$AuthConfirmModel {
  String get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirmation_code')
  String get confirmCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthConfirmModelCopyWith<AuthConfirmModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthConfirmModelCopyWith<$Res> {
  factory $AuthConfirmModelCopyWith(
          AuthConfirmModel value, $Res Function(AuthConfirmModel) then) =
      _$AuthConfirmModelCopyWithImpl<$Res>;
  $Res call(
      {String phone, @JsonKey(name: 'confirmation_code') String confirmCode});
}

/// @nodoc
class _$AuthConfirmModelCopyWithImpl<$Res>
    implements $AuthConfirmModelCopyWith<$Res> {
  _$AuthConfirmModelCopyWithImpl(this._value, this._then);

  final AuthConfirmModel _value;
  // ignore: unused_field
  final $Res Function(AuthConfirmModel) _then;

  @override
  $Res call({
    Object? phone = freezed,
    Object? confirmCode = freezed,
  }) {
    return _then(_value.copyWith(
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      confirmCode: confirmCode == freezed
          ? _value.confirmCode
          : confirmCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AuthConfirmModelCopyWith<$Res>
    implements $AuthConfirmModelCopyWith<$Res> {
  factory _$AuthConfirmModelCopyWith(
          _AuthConfirmModel value, $Res Function(_AuthConfirmModel) then) =
      __$AuthConfirmModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String phone, @JsonKey(name: 'confirmation_code') String confirmCode});
}

/// @nodoc
class __$AuthConfirmModelCopyWithImpl<$Res>
    extends _$AuthConfirmModelCopyWithImpl<$Res>
    implements _$AuthConfirmModelCopyWith<$Res> {
  __$AuthConfirmModelCopyWithImpl(
      _AuthConfirmModel _value, $Res Function(_AuthConfirmModel) _then)
      : super(_value, (v) => _then(v as _AuthConfirmModel));

  @override
  _AuthConfirmModel get _value => super._value as _AuthConfirmModel;

  @override
  $Res call({
    Object? phone = freezed,
    Object? confirmCode = freezed,
  }) {
    return _then(_AuthConfirmModel(
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      confirmCode: confirmCode == freezed
          ? _value.confirmCode
          : confirmCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthConfirmModel implements _AuthConfirmModel {
  _$_AuthConfirmModel(
      {required this.phone,
      @JsonKey(name: 'confirmation_code') required this.confirmCode});

  factory _$_AuthConfirmModel.fromJson(Map<String, dynamic> json) =>
      _$$_AuthConfirmModelFromJson(json);

  @override
  final String phone;
  @override
  @JsonKey(name: 'confirmation_code')
  final String confirmCode;

  @override
  String toString() {
    return 'AuthConfirmModel(phone: $phone, confirmCode: $confirmCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthConfirmModel &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality()
                .equals(other.confirmCode, confirmCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(confirmCode));

  @JsonKey(ignore: true)
  @override
  _$AuthConfirmModelCopyWith<_AuthConfirmModel> get copyWith =>
      __$AuthConfirmModelCopyWithImpl<_AuthConfirmModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthConfirmModelToJson(this);
  }
}

abstract class _AuthConfirmModel implements AuthConfirmModel {
  factory _AuthConfirmModel(
      {required final String phone,
      @JsonKey(name: 'confirmation_code')
          required final String confirmCode}) = _$_AuthConfirmModel;

  factory _AuthConfirmModel.fromJson(Map<String, dynamic> json) =
      _$_AuthConfirmModel.fromJson;

  @override
  String get phone => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'confirmation_code')
  String get confirmCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AuthConfirmModelCopyWith<_AuthConfirmModel> get copyWith =>
      throw _privateConstructorUsedError;
}
