
import 'package:bimed/src/data/model/favorite/favorite_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'under_promotions_model.freezed.dart';
part 'under_promotions_model.g.dart';

@freezed
class UnderPromModel with _$UnderPromModel {
  factory UnderPromModel({
    int? id,
    String? image,
    required ItemModel product
}) = _UnderPromModel;

factory UnderPromModel.fromJson(Map<String, dynamic> json) =>
  _$UnderPromModelFromJson(json);
}
