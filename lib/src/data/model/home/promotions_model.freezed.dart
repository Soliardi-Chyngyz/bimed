// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'promotions_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PromotionsModel _$PromotionsModelFromJson(Map<String, dynamic> json) {
  return _PromotionsModel.fromJson(json);
}

/// @nodoc
mixin _$PromotionsModel {
  int get count => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  List<UnderPromModel> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PromotionsModelCopyWith<PromotionsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromotionsModelCopyWith<$Res> {
  factory $PromotionsModelCopyWith(
          PromotionsModel value, $Res Function(PromotionsModel) then) =
      _$PromotionsModelCopyWithImpl<$Res>;
  $Res call(
      {int count,
      String? previous,
      String? next,
      List<UnderPromModel> results});
}

/// @nodoc
class _$PromotionsModelCopyWithImpl<$Res>
    implements $PromotionsModelCopyWith<$Res> {
  _$PromotionsModelCopyWithImpl(this._value, this._then);

  final PromotionsModel _value;
  // ignore: unused_field
  final $Res Function(PromotionsModel) _then;

  @override
  $Res call({
    Object? count = freezed,
    Object? previous = freezed,
    Object? next = freezed,
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
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<UnderPromModel>,
    ));
  }
}

/// @nodoc
abstract class _$PromotionsModelCopyWith<$Res>
    implements $PromotionsModelCopyWith<$Res> {
  factory _$PromotionsModelCopyWith(
          _PromotionsModel value, $Res Function(_PromotionsModel) then) =
      __$PromotionsModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int count,
      String? previous,
      String? next,
      List<UnderPromModel> results});
}

/// @nodoc
class __$PromotionsModelCopyWithImpl<$Res>
    extends _$PromotionsModelCopyWithImpl<$Res>
    implements _$PromotionsModelCopyWith<$Res> {
  __$PromotionsModelCopyWithImpl(
      _PromotionsModel _value, $Res Function(_PromotionsModel) _then)
      : super(_value, (v) => _then(v as _PromotionsModel));

  @override
  _PromotionsModel get _value => super._value as _PromotionsModel;

  @override
  $Res call({
    Object? count = freezed,
    Object? previous = freezed,
    Object? next = freezed,
    Object? results = freezed,
  }) {
    return _then(_PromotionsModel(
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
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<UnderPromModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PromotionsModel implements _PromotionsModel {
  _$_PromotionsModel(
      {required this.count,
      this.previous,
      this.next,
      required final List<UnderPromModel> results})
      : _results = results;

  factory _$_PromotionsModel.fromJson(Map<String, dynamic> json) =>
      _$$_PromotionsModelFromJson(json);

  @override
  final int count;
  @override
  final String? previous;
  @override
  final String? next;
  final List<UnderPromModel> _results;
  @override
  List<UnderPromModel> get results {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PromotionsModel(count: $count, previous: $previous, next: $next, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PromotionsModel &&
            const DeepCollectionEquality().equals(other.count, count) &&
            const DeepCollectionEquality().equals(other.previous, previous) &&
            const DeepCollectionEquality().equals(other.next, next) &&
            const DeepCollectionEquality().equals(other.results, results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(count),
      const DeepCollectionEquality().hash(previous),
      const DeepCollectionEquality().hash(next),
      const DeepCollectionEquality().hash(results));

  @JsonKey(ignore: true)
  @override
  _$PromotionsModelCopyWith<_PromotionsModel> get copyWith =>
      __$PromotionsModelCopyWithImpl<_PromotionsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PromotionsModelToJson(this);
  }
}

abstract class _PromotionsModel implements PromotionsModel {
  factory _PromotionsModel(
      {required final int count,
      final String? previous,
      final String? next,
      required final List<UnderPromModel> results}) = _$_PromotionsModel;

  factory _PromotionsModel.fromJson(Map<String, dynamic> json) =
      _$_PromotionsModel.fromJson;

  @override
  int get count => throw _privateConstructorUsedError;
  @override
  String? get previous => throw _privateConstructorUsedError;
  @override
  String? get next => throw _privateConstructorUsedError;
  @override
  List<UnderPromModel> get results => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PromotionsModelCopyWith<_PromotionsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
