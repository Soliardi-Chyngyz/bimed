// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'slider_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SliderModel _$SliderModelFromJson(Map<String, dynamic> json) {
  return _SliderModel.fromJson(json);
}

/// @nodoc
mixin _$SliderModel {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get link => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SliderModelCopyWith<SliderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SliderModelCopyWith<$Res> {
  factory $SliderModelCopyWith(
          SliderModel value, $Res Function(SliderModel) then) =
      _$SliderModelCopyWithImpl<$Res>;
  $Res call({int? id, String? title, String? link, String? image});
}

/// @nodoc
class _$SliderModelCopyWithImpl<$Res> implements $SliderModelCopyWith<$Res> {
  _$SliderModelCopyWithImpl(this._value, this._then);

  final SliderModel _value;
  // ignore: unused_field
  final $Res Function(SliderModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? link = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$SliderModelCopyWith<$Res>
    implements $SliderModelCopyWith<$Res> {
  factory _$SliderModelCopyWith(
          _SliderModel value, $Res Function(_SliderModel) then) =
      __$SliderModelCopyWithImpl<$Res>;
  @override
  $Res call({int? id, String? title, String? link, String? image});
}

/// @nodoc
class __$SliderModelCopyWithImpl<$Res> extends _$SliderModelCopyWithImpl<$Res>
    implements _$SliderModelCopyWith<$Res> {
  __$SliderModelCopyWithImpl(
      _SliderModel _value, $Res Function(_SliderModel) _then)
      : super(_value, (v) => _then(v as _SliderModel));

  @override
  _SliderModel get _value => super._value as _SliderModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? link = freezed,
    Object? image = freezed,
  }) {
    return _then(_SliderModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SliderModel implements _SliderModel {
  _$_SliderModel({this.id, this.title, this.link, this.image});

  factory _$_SliderModel.fromJson(Map<String, dynamic> json) =>
      _$$_SliderModelFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? link;
  @override
  final String? image;

  @override
  String toString() {
    return 'SliderModel(id: $id, title: $title, link: $link, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SliderModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.link, link) &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(link),
      const DeepCollectionEquality().hash(image));

  @JsonKey(ignore: true)
  @override
  _$SliderModelCopyWith<_SliderModel> get copyWith =>
      __$SliderModelCopyWithImpl<_SliderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SliderModelToJson(this);
  }
}

abstract class _SliderModel implements SliderModel {
  factory _SliderModel(
      {final int? id,
      final String? title,
      final String? link,
      final String? image}) = _$_SliderModel;

  factory _SliderModel.fromJson(Map<String, dynamic> json) =
      _$_SliderModel.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  String? get link => throw _privateConstructorUsedError;
  @override
  String? get image => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SliderModelCopyWith<_SliderModel> get copyWith =>
      throw _privateConstructorUsedError;
}
