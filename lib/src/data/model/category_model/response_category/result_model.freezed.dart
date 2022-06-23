// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResultModel _$ResultModelFromJson(Map<String, dynamic> json) {
  return _ResultModel.fromJson(json);
}

/// @nodoc
mixin _$ResultModel {
  int get count => throw _privateConstructorUsedError;
  int? get previous => throw _privateConstructorUsedError;
  int? get next => throw _privateConstructorUsedError;
  @JsonKey(name: 'num_pages')
  int? get numPage => throw _privateConstructorUsedError;
  List<ItemModel> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResultModelCopyWith<ResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultModelCopyWith<$Res> {
  factory $ResultModelCopyWith(
          ResultModel value, $Res Function(ResultModel) then) =
      _$ResultModelCopyWithImpl<$Res>;
  $Res call(
      {int count,
      int? previous,
      int? next,
      @JsonKey(name: 'num_pages') int? numPage,
      List<ItemModel> results});
}

/// @nodoc
class _$ResultModelCopyWithImpl<$Res> implements $ResultModelCopyWith<$Res> {
  _$ResultModelCopyWithImpl(this._value, this._then);

  final ResultModel _value;
  // ignore: unused_field
  final $Res Function(ResultModel) _then;

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
              as int?,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$ResultModelCopyWith<$Res>
    implements $ResultModelCopyWith<$Res> {
  factory _$ResultModelCopyWith(
          _ResultModel value, $Res Function(_ResultModel) then) =
      __$ResultModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int count,
      int? previous,
      int? next,
      @JsonKey(name: 'num_pages') int? numPage,
      List<ItemModel> results});
}

/// @nodoc
class __$ResultModelCopyWithImpl<$Res> extends _$ResultModelCopyWithImpl<$Res>
    implements _$ResultModelCopyWith<$Res> {
  __$ResultModelCopyWithImpl(
      _ResultModel _value, $Res Function(_ResultModel) _then)
      : super(_value, (v) => _then(v as _ResultModel));

  @override
  _ResultModel get _value => super._value as _ResultModel;

  @override
  $Res call({
    Object? count = freezed,
    Object? previous = freezed,
    Object? next = freezed,
    Object? numPage = freezed,
    Object? results = freezed,
  }) {
    return _then(_ResultModel(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      previous: previous == freezed
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as int?,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as int?,
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
class _$_ResultModel implements _ResultModel {
  _$_ResultModel(
      {required this.count,
      this.previous,
      this.next,
      @JsonKey(name: 'num_pages') this.numPage,
      required final List<ItemModel> results})
      : _results = results;

  factory _$_ResultModel.fromJson(Map<String, dynamic> json) =>
      _$$_ResultModelFromJson(json);

  @override
  final int count;
  @override
  final int? previous;
  @override
  final int? next;
  @override
  @JsonKey(name: 'num_pages')
  final int? numPage;
  final List<ItemModel> _results;
  @override
  List<ItemModel> get results {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'ResultModel(count: $count, previous: $previous, next: $next, numPage: $numPage, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResultModel &&
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
  _$ResultModelCopyWith<_ResultModel> get copyWith =>
      __$ResultModelCopyWithImpl<_ResultModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResultModelToJson(this);
  }
}

abstract class _ResultModel implements ResultModel {
  factory _ResultModel(
      {required final int count,
      final int? previous,
      final int? next,
      @JsonKey(name: 'num_pages') final int? numPage,
      required final List<ItemModel> results}) = _$_ResultModel;

  factory _ResultModel.fromJson(Map<String, dynamic> json) =
      _$_ResultModel.fromJson;

  @override
  int get count => throw _privateConstructorUsedError;
  @override
  int? get previous => throw _privateConstructorUsedError;
  @override
  int? get next => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'num_pages')
  int? get numPage => throw _privateConstructorUsedError;
  @override
  List<ItemModel> get results => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ResultModelCopyWith<_ResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}
