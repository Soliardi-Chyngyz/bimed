// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'favorite_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) {
  return _FavoriteModel.fromJson(json);
}

/// @nodoc
mixin _$ItemModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'in_card')
  bool? get inCart => throw _privateConstructorUsedError;
  @JsonKey(name: 'count_in_card')
  int? get countInCart => throw _privateConstructorUsedError;
  @JsonKey(name: 'in_favorite')
  bool? get inFavorite => throw _privateConstructorUsedError;
  @JsonKey(name: 'by_prescription')
  bool get byPrescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_type')
  String get productType => throw _privateConstructorUsedError;
  @JsonKey(name: 'cart_item_id')
  int? get cartItemId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemModelCopyWith<ItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemModelCopyWith<$Res> {
  factory $ItemModelCopyWith(ItemModel value, $Res Function(ItemModel) then) =
      _$ItemModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      String? image,
      int? price,
      @JsonKey(name: 'in_card') bool? inCart,
      @JsonKey(name: 'count_in_card') int? countInCart,
      @JsonKey(name: 'in_favorite') bool? inFavorite,
      @JsonKey(name: 'by_prescription') bool byPrescription,
      @JsonKey(name: 'product_type') String productType,
      @JsonKey(name: 'cart_item_id') int? cartItemId});
}

/// @nodoc
class _$ItemModelCopyWithImpl<$Res> implements $ItemModelCopyWith<$Res> {
  _$ItemModelCopyWithImpl(this._value, this._then);

  final ItemModel _value;
  // ignore: unused_field
  final $Res Function(ItemModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? price = freezed,
    Object? inCart = freezed,
    Object? countInCart = freezed,
    Object? inFavorite = freezed,
    Object? byPrescription = freezed,
    Object? productType = freezed,
    Object? cartItemId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      inCart: inCart == freezed
          ? _value.inCart
          : inCart // ignore: cast_nullable_to_non_nullable
              as bool?,
      countInCart: countInCart == freezed
          ? _value.countInCart
          : countInCart // ignore: cast_nullable_to_non_nullable
              as int?,
      inFavorite: inFavorite == freezed
          ? _value.inFavorite
          : inFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      byPrescription: byPrescription == freezed
          ? _value.byPrescription
          : byPrescription // ignore: cast_nullable_to_non_nullable
              as bool,
      productType: productType == freezed
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as String,
      cartItemId: cartItemId == freezed
          ? _value.cartItemId
          : cartItemId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$FavoriteModelCopyWith<$Res>
    implements $ItemModelCopyWith<$Res> {
  factory _$FavoriteModelCopyWith(
          _FavoriteModel value, $Res Function(_FavoriteModel) then) =
      __$FavoriteModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      String? image,
      int? price,
      @JsonKey(name: 'in_card') bool? inCart,
      @JsonKey(name: 'count_in_card') int? countInCart,
      @JsonKey(name: 'in_favorite') bool? inFavorite,
      @JsonKey(name: 'by_prescription') bool byPrescription,
      @JsonKey(name: 'product_type') String productType,
      @JsonKey(name: 'cart_item_id') int? cartItemId});
}

/// @nodoc
class __$FavoriteModelCopyWithImpl<$Res> extends _$ItemModelCopyWithImpl<$Res>
    implements _$FavoriteModelCopyWith<$Res> {
  __$FavoriteModelCopyWithImpl(
      _FavoriteModel _value, $Res Function(_FavoriteModel) _then)
      : super(_value, (v) => _then(v as _FavoriteModel));

  @override
  _FavoriteModel get _value => super._value as _FavoriteModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? price = freezed,
    Object? inCart = freezed,
    Object? countInCart = freezed,
    Object? inFavorite = freezed,
    Object? byPrescription = freezed,
    Object? productType = freezed,
    Object? cartItemId = freezed,
  }) {
    return _then(_FavoriteModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      inCart: inCart == freezed
          ? _value.inCart
          : inCart // ignore: cast_nullable_to_non_nullable
              as bool?,
      countInCart: countInCart == freezed
          ? _value.countInCart
          : countInCart // ignore: cast_nullable_to_non_nullable
              as int?,
      inFavorite: inFavorite == freezed
          ? _value.inFavorite
          : inFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      byPrescription: byPrescription == freezed
          ? _value.byPrescription
          : byPrescription // ignore: cast_nullable_to_non_nullable
              as bool,
      productType: productType == freezed
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as String,
      cartItemId: cartItemId == freezed
          ? _value.cartItemId
          : cartItemId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FavoriteModel implements _FavoriteModel {
  _$_FavoriteModel(
      {required this.id,
      required this.name,
      this.image,
      this.price,
      @JsonKey(name: 'in_card') this.inCart,
      @JsonKey(name: 'count_in_card') this.countInCart,
      @JsonKey(name: 'in_favorite') this.inFavorite,
      @JsonKey(name: 'by_prescription') this.byPrescription = false,
      @JsonKey(name: 'product_type') required this.productType,
      @JsonKey(name: 'cart_item_id') this.cartItemId});

  factory _$_FavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$$_FavoriteModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? image;
  @override
  final int? price;
  @override
  @JsonKey(name: 'in_card')
  final bool? inCart;
  @override
  @JsonKey(name: 'count_in_card')
  final int? countInCart;
  @override
  @JsonKey(name: 'in_favorite')
  final bool? inFavorite;
  @override
  @JsonKey(name: 'by_prescription')
  final bool byPrescription;
  @override
  @JsonKey(name: 'product_type')
  final String productType;
  @override
  @JsonKey(name: 'cart_item_id')
  final int? cartItemId;

  @JsonKey(ignore: true)
  @override
  _$FavoriteModelCopyWith<_FavoriteModel> get copyWith =>
      __$FavoriteModelCopyWithImpl<_FavoriteModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FavoriteModelToJson(this);
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      image,
      price,
      inCart,
      countInCart,
      inFavorite,
      byPrescription,
      productType
    ];
  }

  @override
  bool get stringify => true;
}

abstract class _FavoriteModel implements ItemModel {
  factory _FavoriteModel(
      {required final int id,
      required final String name,
      final String? image,
      final int? price,
      @JsonKey(name: 'in_card') final bool? inCart,
      @JsonKey(name: 'count_in_card') final int? countInCart,
      @JsonKey(name: 'in_favorite') final bool? inFavorite,
      @JsonKey(name: 'by_prescription') final bool byPrescription,
      @JsonKey(name: 'product_type') required final String productType,
      @JsonKey(name: 'cart_item_id') final int? cartItemId}) = _$_FavoriteModel;

  factory _FavoriteModel.fromJson(Map<String, dynamic> json) =
      _$_FavoriteModel.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String? get image => throw _privateConstructorUsedError;
  @override
  int? get price => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'in_card')
  bool? get inCart => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'count_in_card')
  int? get countInCart => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'in_favorite')
  bool? get inFavorite => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'by_prescription')
  bool get byPrescription => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'product_type')
  String get productType => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'cart_item_id')
  int? get cartItemId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FavoriteModelCopyWith<_FavoriteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FavoritesList {
  List<ItemModel> get list => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoritesListCopyWith<FavoritesList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoritesListCopyWith<$Res> {
  factory $FavoritesListCopyWith(
          FavoritesList value, $Res Function(FavoritesList) then) =
      _$FavoritesListCopyWithImpl<$Res>;
  $Res call({List<ItemModel> list});
}

/// @nodoc
class _$FavoritesListCopyWithImpl<$Res>
    implements $FavoritesListCopyWith<$Res> {
  _$FavoritesListCopyWithImpl(this._value, this._then);

  final FavoritesList _value;
  // ignore: unused_field
  final $Res Function(FavoritesList) _then;

  @override
  $Res call({
    Object? list = freezed,
  }) {
    return _then(_value.copyWith(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<ItemModel>,
    ));
  }
}

/// @nodoc
abstract class _$FavoritesListCopyWith<$Res>
    implements $FavoritesListCopyWith<$Res> {
  factory _$FavoritesListCopyWith(
          _FavoritesList value, $Res Function(_FavoritesList) then) =
      __$FavoritesListCopyWithImpl<$Res>;
  @override
  $Res call({List<ItemModel> list});
}

/// @nodoc
class __$FavoritesListCopyWithImpl<$Res>
    extends _$FavoritesListCopyWithImpl<$Res>
    implements _$FavoritesListCopyWith<$Res> {
  __$FavoritesListCopyWithImpl(
      _FavoritesList _value, $Res Function(_FavoritesList) _then)
      : super(_value, (v) => _then(v as _FavoritesList));

  @override
  _FavoritesList get _value => super._value as _FavoritesList;

  @override
  $Res call({
    Object? list = freezed,
  }) {
    return _then(_FavoritesList(
      list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<ItemModel>,
    ));
  }
}

/// @nodoc

class _$_FavoritesList implements _FavoritesList {
  _$_FavoritesList(this.list);

  @override
  final List<ItemModel> list;

  @override
  String toString() {
    return 'FavoritesList(list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FavoritesList &&
            const DeepCollectionEquality().equals(other.list, list));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(list));

  @JsonKey(ignore: true)
  @override
  _$FavoritesListCopyWith<_FavoritesList> get copyWith =>
      __$FavoritesListCopyWithImpl<_FavoritesList>(this, _$identity);
}

abstract class _FavoritesList implements FavoritesList {
  factory _FavoritesList(final List<ItemModel> list) = _$_FavoritesList;

  @override
  List<ItemModel> get list => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FavoritesListCopyWith<_FavoritesList> get copyWith =>
      throw _privateConstructorUsedError;
}
