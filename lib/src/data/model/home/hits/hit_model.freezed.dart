// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'hit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HitModel _$HitModelFromJson(Map<String, dynamic> json) {
  return _HitModel.fromJson(json);
}

/// @nodoc
mixin _$HitModel {
  int get count => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  @JsonKey(name: 'num_pages')
  int? get numPage => throw _privateConstructorUsedError;
  List<ItemModel> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HitModelCopyWith<HitModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HitModelCopyWith<$Res> {
  factory $HitModelCopyWith(HitModel value, $Res Function(HitModel) then) =
      _$HitModelCopyWithImpl<$Res>;
  $Res call(
      {int count,
      String? previous,
      String? next,
      @JsonKey(name: 'num_pages') int? numPage,
      List<ItemModel> results});
}

/// @nodoc
class _$HitModelCopyWithImpl<$Res> implements $HitModelCopyWith<$Res> {
  _$HitModelCopyWithImpl(this._value, this._then);

  final HitModel _value;
  // ignore: unused_field
  final $Res Function(HitModel) _then;

  @override
  $Res call({
    Object? count = freezed,
    Object? previous = freezed,
    Object? next = freezed,
    Object? numPage = freezed,
    Object? results = freezed,
  }) {
    return _then(_value.copyWith(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      previous: previous == freezed
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      numPage: numPage == freezed
          ? _value.numPage
          : numPage // ignore: cast_nullable_to_non_nullable
              as int?,
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<ItemModel>,
    ));
  }
}

/// @nodoc
abstract class _$HitModelCopyWith<$Res> implements $HitModelCopyWith<$Res> {
  factory _$HitModelCopyWith(_HitModel value, $Res Function(_HitModel) then) =
      __$HitModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int count,
      String? previous,
      String? next,
      @JsonKey(name: 'num_pages') int? numPage,
      List<ItemModel> results});
}

/// @nodoc
class __$HitModelCopyWithImpl<$Res> extends _$HitModelCopyWithImpl<$Res>
    implements _$HitModelCopyWith<$Res> {
  __$HitModelCopyWithImpl(_HitModel _value, $Res Function(_HitModel) _then)
      : super(_value, (v) => _then(v as _HitModel));

  @override
  _HitModel get _value => super._value as _HitModel;

  @override
  $Res call({
    Object? count = freezed,
    Object? previous = freezed,
    Object? next = freezed,
    Object? numPage = freezed,
    Object? results = freezed,
  }) {
    return _then(_HitModel(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      previous: previous == freezed
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      numPage: numPage == freezed
          ? _value.numPage
          : numPage // ignore: cast_nullable_to_non_nullable
              as int?,
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<ItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HitModel implements _HitModel {
  _$_HitModel(
      {required this.count,
      this.previous,
      this.next,
      @JsonKey(name: 'num_pages') this.numPage,
      required this.results});

  factory _$_HitModel.fromJson(Map<String, dynamic> json) =>
      _$$_HitModelFromJson(json);

  @override
  final int count;
  @override
  final String? previous;
  @override
  final String? next;
  @override
  @JsonKey(name: 'num_pages')
  final int? numPage;
  @override
  final List<ItemModel> results;

  @override
  String toString() {
    return 'HitModel(count: $count, previous: $previous, next: $next, numPage: $numPage, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HitModel &&
            const DeepCollectionEquality().equals(other.count, count) &&
            const DeepCollectionEquality().equals(other.previous, previous) &&
            const DeepCollectionEquality().equals(other.next, next) &&
            const DeepCollectionEquality().equals(other.numPage, numPage) &&
            const DeepCollectionEquality().equals(other.results, results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(count),
      const DeepCollectionEquality().hash(previous),
      const DeepCollectionEquality().hash(next),
      const DeepCollectionEquality().hash(numPage),
      const DeepCollectionEquality().hash(results));

  @JsonKey(ignore: true)
  @override
  _$HitModelCopyWith<_HitModel> get copyWith =>
      __$HitModelCopyWithImpl<_HitModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HitModelToJson(this);
  }
}

abstract class _HitModel implements HitModel {
  factory _HitModel(
      {required final int count,
      final String? previous,
      final String? next,
      @JsonKey(name: 'num_pages') final int? numPage,
      required final List<ItemModel> results}) = _$_HitModel;

  factory _HitModel.fromJson(Map<String, dynamic> json) = _$_HitModel.fromJson;

  @override
  int get count => throw _privateConstructorUsedError;
  @override
  String? get previous => throw _privateConstructorUsedError;
  @override
  String? get next => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'num_pages')
  int? get numPage => throw _privateConstructorUsedError;
  @override
  List<ItemModel> get results => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$HitModelCopyWith<_HitModel> get copyWith =>
      throw _privateConstructorUsedError;
}
