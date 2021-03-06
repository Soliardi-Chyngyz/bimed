// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'avatar_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AvatarModel _$AvatarModelFromJson(Map<String, dynamic> json) {
  return _AvatarModel.fromJson(json);
}

/// @nodoc
mixin _$AvatarModel {
  String get avatar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AvatarModelCopyWith<AvatarModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvatarModelCopyWith<$Res> {
  factory $AvatarModelCopyWith(
          AvatarModel value, $Res Function(AvatarModel) then) =
      _$AvatarModelCopyWithImpl<$Res>;
  $Res call({String avatar});
}

/// @nodoc
class _$AvatarModelCopyWithImpl<$Res> implements $AvatarModelCopyWith<$Res> {
  _$AvatarModelCopyWithImpl(this._value, this._then);

  final AvatarModel _value;
  // ignore: unused_field
  final $Res Function(AvatarModel) _then;

  @override
  $Res call({
    Object? avatar = freezed,
  }) {
    return _then(_value.copyWith(
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AvatarModelCopyWith<$Res>
    implements $AvatarModelCopyWith<$Res> {
  factory _$AvatarModelCopyWith(
          _AvatarModel value, $Res Function(_AvatarModel) then) =
      __$AvatarModelCopyWithImpl<$Res>;
  @override
  $Res call({String avatar});
}

/// @nodoc
class __$AvatarModelCopyWithImpl<$Res> extends _$AvatarModelCopyWithImpl<$Res>
    implements _$AvatarModelCopyWith<$Res> {
  __$AvatarModelCopyWithImpl(
      _AvatarModel _value, $Res Function(_AvatarModel) _then)
      : super(_value, (v) => _then(v as _AvatarModel));

  @override
  _AvatarModel get _value => super._value as _AvatarModel;

  @override
  $Res call({
    Object? avatar = freezed,
  }) {
    return _then(_AvatarModel(
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AvatarModel implements _AvatarModel {
  _$_AvatarModel({required this.avatar});

  factory _$_AvatarModel.fromJson(Map<String, dynamic> json) =>
      _$$_AvatarModelFromJson(json);

  @override
  final String avatar;

  @override
  String toString() {
    return 'AvatarModel(avatar: $avatar)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AvatarModel &&
            const DeepCollectionEquality().equals(other.avatar, avatar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(avatar));

  @JsonKey(ignore: true)
  @override
  _$AvatarModelCopyWith<_AvatarModel> get copyWith =>
      __$AvatarModelCopyWithImpl<_AvatarModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AvatarModelToJson(this);
  }
}

abstract class _AvatarModel implements AvatarModel {
  factory _AvatarModel({required final String avatar}) = _$_AvatarModel;

  factory _AvatarModel.fromJson(Map<String, dynamic> json) =
      _$_AvatarModel.fromJson;

  @override
  String get avatar => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AvatarModelCopyWith<_AvatarModel> get copyWith =>
      throw _privateConstructorUsedError;
}
