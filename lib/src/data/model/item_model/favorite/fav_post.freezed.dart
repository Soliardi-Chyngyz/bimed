// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fav_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FavoritePostModel _$FavoritePostModelFromJson(Map<String, dynamic> json) {
  return _FavoritePostModel.fromJson(json);
}

/// @nodoc
mixin _$FavoritePostModel {
  int? get id => throw _privateConstructorUsedError;
  int? get user => throw _privateConstructorUsedError;
  List<int>? get product => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoritePostModelCopyWith<FavoritePostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoritePostModelCopyWith<$Res> {
  factory $FavoritePostModelCopyWith(
          FavoritePostModel value, $Res Function(FavoritePostModel) then) =
      _$FavoritePostModelCopyWithImpl<$Res>;
  $Res call({int? id, int? user, List<int>? product});
}

/// @nodoc
class _$FavoritePostModelCopyWithImpl<$Res>
    implements $FavoritePostModelCopyWith<$Res> {
  _$FavoritePostModelCopyWithImpl(this._value, this._then);

  final FavoritePostModel _value;
  // ignore: unused_field
  final $Res Function(FavoritePostModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? product = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as int?,
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
abstract class _$FavoritePostModelCopyWith<$Res>
    implements $FavoritePostModelCopyWith<$Res> {
  factory _$FavoritePostModelCopyWith(
          _FavoritePostModel value, $Res Function(_FavoritePostModel) then) =
      __$FavoritePostModelCopyWithImpl<$Res>;
  @override
  $Res call({int? id, int? user, List<int>? product});
}

/// @nodoc
class __$FavoritePostModelCopyWithImpl<$Res>
    extends _$FavoritePostModelCopyWithImpl<$Res>
    implements _$FavoritePostModelCopyWith<$Res> {
  __$FavoritePostModelCopyWithImpl(
      _FavoritePostModel _value, $Res Function(_FavoritePostModel) _then)
      : super(_value, (v) => _then(v as _FavoritePostModel));

  @override
  _FavoritePostModel get _value => super._value as _FavoritePostModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? product = freezed,
  }) {
    return _then(_FavoritePostModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as int?,
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FavoritePostModel implements _FavoritePostModel {
  _$_FavoritePostModel({this.id, this.user, final List<int>? product})
      : _product = product;

  factory _$_FavoritePostModel.fromJson(Map<String, dynamic> json) =>
      _$$_FavoritePostModelFromJson(json);

  @override
  final int? id;
  @override
  final int? user;
  final List<int>? _product;
  @override
  List<int>? get product {
    final value = _product;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FavoritePostModel(id: $id, user: $user, product: $product)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FavoritePostModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.product, product));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(product));

  @JsonKey(ignore: true)
  @override
  _$FavoritePostModelCopyWith<_FavoritePostModel> get copyWith =>
      __$FavoritePostModelCopyWithImpl<_FavoritePostModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FavoritePostModelToJson(this);
  }
}

abstract class _FavoritePostModel implements FavoritePostModel {
  factory _FavoritePostModel(
      {final int? id,
      final int? user,
      final List<int>? product}) = _$_FavoritePostModel;

  factory _FavoritePostModel.fromJson(Map<String, dynamic> json) =
      _$_FavoritePostModel.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  int? get user => throw _privateConstructorUsedError;
  @override
  List<int>? get product => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FavoritePostModelCopyWith<_FavoritePostModel> get copyWith =>
      throw _privateConstructorUsedError;
}
