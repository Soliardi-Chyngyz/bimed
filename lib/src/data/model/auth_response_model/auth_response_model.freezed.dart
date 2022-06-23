// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthResponseModel _$AuthResponseModelFromJson(Map<String, dynamic> json) {
  return _AuthResponseModel.fromJson(json);
}

/// @nodoc
mixin _$AuthResponseModel {
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthResponseModelCopyWith<AuthResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthResponseModelCopyWith<$Res> {
  factory $AuthResponseModelCopyWith(
          AuthResponseModel value, $Res Function(AuthResponseModel) then) =
      _$AuthResponseModelCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$AuthResponseModelCopyWithImpl<$Res>
    implements $AuthResponseModelCopyWith<$Res> {
  _$AuthResponseModelCopyWithImpl(this._value, this._then);

  final AuthResponseModel _value;
  // ignore: unused_field
  final $Res Function(AuthResponseModel) _then;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AuthResponseModelCopyWith<$Res>
    implements $AuthResponseModelCopyWith<$Res> {
  factory _$AuthResponseModelCopyWith(
          _AuthResponseModel value, $Res Function(_AuthResponseModel) then) =
      __$AuthResponseModelCopyWithImpl<$Res>;
  @override
  $Res call({String message});
}

/// @nodoc
class __$AuthResponseModelCopyWithImpl<$Res>
    extends _$AuthResponseModelCopyWithImpl<$Res>
    implements _$AuthResponseModelCopyWith<$Res> {
  __$AuthResponseModelCopyWithImpl(
      _AuthResponseModel _value, $Res Function(_AuthResponseModel) _then)
      : super(_value, (v) => _then(v as _AuthResponseModel));

  @override
  _AuthResponseModel get _value => super._value as _AuthResponseModel;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_AuthResponseModel(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthResponseModel implements _AuthResponseModel {
  _$_AuthResponseModel({required this.message});

  factory _$_AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_AuthResponseModelFromJson(json);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthResponseModel(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthResponseModel &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$AuthResponseModelCopyWith<_AuthResponseModel> get copyWith =>
      __$AuthResponseModelCopyWithImpl<_AuthResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthResponseModelToJson(this);
  }
}

abstract class _AuthResponseModel implements AuthResponseModel {
  factory _AuthResponseModel({required final String message}) =
      _$_AuthResponseModel;

  factory _AuthResponseModel.fromJson(Map<String, dynamic> json) =
      _$_AuthResponseModel.fromJson;

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AuthResponseModelCopyWith<_AuthResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
