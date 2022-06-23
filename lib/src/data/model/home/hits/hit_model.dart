import 'package:freezed_annotation/freezed_annotation.dart';
import '../../favorite/favorite_model.dart';

part 'hit_model.freezed.dart';
part 'hit_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class HitModel with _$HitModel {

  factory HitModel(
          {required int count,
          String? previous,
          String? next,
          @JsonKey(name: 'num_pages') int? numPage,
          required List<ItemModel> results}) = _HitModel;

  factory HitModel.fromJson(Map<String, dynamic> json) =>
      _$HitModelFromJson(json);

}
