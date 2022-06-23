// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'news_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewsItemModel _$NewsItemModelFromJson(Map<String, dynamic> json) {
  return _NewsItemModel.fromJson(json);
}

/// @nodoc
mixin _$NewsItemModel {
  int? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get gallery => throw _privateConstructorUsedError;
  @JsonKey(name: 'get_short_description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'publication_date')
  String get publicDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsItemModelCopyWith<NewsItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsItemModelCopyWith<$Res> {
  factory $NewsItemModelCopyWith(
          NewsItemModel value, $Res Function(NewsItemModel) then) =
      _$NewsItemModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String title,
      String? gallery,
      @JsonKey(name: 'get_short_description') String? description,
      @JsonKey(name: 'publication_date') String publicDate});
}

/// @nodoc
class _$NewsItemModelCopyWithImpl<$Res>
    implements $NewsItemModelCopyWith<$Res> {
  _$NewsItemModelCopyWithImpl(this._value, this._then);

  final NewsItemModel _value;
  // ignore: unused_field
  final $Res Function(NewsItemModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? gallery = freezed,
    Object? description = freezed,
    Object? publicDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      gallery: gallery == freezed
          ? _value.gallery
          : gallery // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      publicDate: publicDate == freezed
          ? _value.publicDate
          : publicDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$NewsItemModelCopyWith<$Res>
    implements $NewsItemModelCopyWith<$Res> {
  factory _$NewsItemModelCopyWith(
          _NewsItemModel value, $Res Function(_NewsItemModel) then) =
      __$NewsItemModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String title,
      String? gallery,
      @JsonKey(name: 'get_short_description') String? description,
      @JsonKey(name: 'publication_date') String publicDate});
}

/// @nodoc
class __$NewsItemModelCopyWithImpl<$Res>
    extends _$NewsItemModelCopyWithImpl<$Res>
    implements _$NewsItemModelCopyWith<$Res> {
  __$NewsItemModelCopyWithImpl(
      _NewsItemModel _value, $Res Function(_NewsItemModel) _then)
      : super(_value, (v) => _then(v as _NewsItemModel));

  @override
  _NewsItemModel get _value => super._value as _NewsItemModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? gallery = freezed,
    Object? description = freezed,
    Object? publicDate = freezed,
  }) {
    return _then(_NewsItemModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      gallery: gallery == freezed
          ? _value.gallery
          : gallery // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      publicDate: publicDate == freezed
          ? _value.publicDate
          : publicDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewsItemModel implements _NewsItemModel {
  _$_NewsItemModel(
      {this.id,
      required this.title,
      this.gallery,
      @JsonKey(name: 'get_short_description') this.description,
      @JsonKey(name: 'publication_date') required this.publicDate});

  factory _$_NewsItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_NewsItemModelFromJson(json);

  @override
  final int? id;
  @override
  final String title;
  @override
  final String? gallery;
  @override
  @JsonKey(name: 'get_short_description')
  final String? description;
  @override
  @JsonKey(name: 'publication_date')
  final String publicDate;

  @override
  String toString() {
    return 'NewsItemModel(id: $id, title: $title, gallery: $gallery, description: $description, publicDate: $publicDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewsItemModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.gallery, gallery) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.publicDate, publicDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(gallery),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(publicDate));

  @JsonKey(ignore: true)
  @override
  _$NewsItemModelCopyWith<_NewsItemModel> get copyWith =>
      __$NewsItemModelCopyWithImpl<_NewsItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewsItemModelToJson(this);
  }
}

abstract class _NewsItemModel implements NewsItemModel {
  factory _NewsItemModel(
      {final int? id,
      required final String title,
      final String? gallery,
      @JsonKey(name: 'get_short_description')
          final String? description,
      @JsonKey(name: 'publication_date')
          required final String publicDate}) = _$_NewsItemModel;

  factory _NewsItemModel.fromJson(Map<String, dynamic> json) =
      _$_NewsItemModel.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String? get gallery => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'get_short_description')
  String? get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'publication_date')
  String get publicDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NewsItemModelCopyWith<_NewsItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
