// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'under_promotions_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnderPromModel _$UnderPromModelFromJson(Map<String, dynamic> json) {
  return _UnderPromModel.fromJson(json);
}

/// @nodoc
mixin _$UnderPromModel {
  int? get id => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  ItemModel get product => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnderPromModelCopyWith<UnderPromModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnderPromModelCopyWith<$Res> {
  factory $UnderPromModelCopyWith(
          UnderPromModel value, $Res Function(UnderPromModel) then) =
      _$UnderPromModelCopyWithImpl<$Res>;
  $Res call({int? id, String? image, ItemModel product});

  $ItemModelCopyWith<$Res> get product;
}

/// @nodoc
class _$UnderPromModelCopyWithImpl<$Res>
    implements $UnderPromModelCopyWith<$Res> {
  _$UnderPromModelCopyWithImpl(this._value, this._then);

  final UnderPromModel _value;
  // ignore: unused_field
  final $Res Function(UnderPromModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? product = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ItemModel,
    ));
  }

  @override
  $ItemModelCopyWith<$Res> get product {
    return $ItemModelCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value));
    });
  }
}

/// @nodoc
abstract class _$UnderPromModelCopyWith<$Res>
    implements $UnderPromModelCopyWith<$Res> {
  factory _$UnderPromModelCopyWith(
          _UnderPromModel value, $Res Function(_UnderPromModel) then) =
      __$UnderPromModelCopyWithImpl<$Res>;
  @override
  $Res call({int? id, String? image, ItemModel product});

  @override
  $ItemModelCopyWith<$Res> get product;
}

/// @nodoc
class __$UnderPromModelCopyWithImpl<$Res>
    extends _$UnderPromModelCopyWithImpl<$Res>
    implements _$UnderPromModelCopyWith<$Res> {
  __$UnderPromModelCopyWithImpl(
      _UnderPromModel _value, $Res Function(_UnderPromModel) _then)
      : super(_value, (v) => _then(v as _UnderPromModel));

  @override
  _UnderPromModel get _value => super._value as _UnderPromModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? product = freezed,
  }) {
    return _then(_UnderPromModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ItemModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnderPromModel implements _UnderPromModel {
  _$_UnderPromModel({this.id, this.image, required this.product});

  factory _$_UnderPromModel.fromJson(Map<String, dynamic> json) =>
      _$$_UnderPromModelFromJson(json);

  @override
  final int? id;
  @override
  final String? image;
  @override
  final ItemModel product;

  @override
  String toString() {
    return 'UnderPromModel(id: $id, image: $image, product: $product)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnderPromModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.product, product));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(product));

  @JsonKey(ignore: true)
  @override
  _$UnderPromModelCopyWith<_UnderPromModel> get copyWith =>
      __$UnderPromModelCopyWithImpl<_UnderPromModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnderPromModelToJson(this);
  }
}

abstract class _UnderPromModel implements UnderPromModel {
  factory _UnderPromModel(
      {final int? id,
      final String? image,
      required final ItemModel product}) = _$_UnderPromModel;

  factory _UnderPromModel.fromJson(Map<String, dynamic> json) =
      _$_UnderPromModel.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get image => throw _privateConstructorUsedError;
  @override
  ItemModel get product => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnderPromModelCopyWith<_UnderPromModel> get copyWith =>
      throw _privateConstructorUsedError;
}
