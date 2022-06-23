import 'package:bimed/src/data/model/home/under_promotions_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'promotions_model.freezed.dart';
part 'promotions_model.g.dart';

@freezed
class PromotionsModel with _$PromotionsModel {
  factory PromotionsModel({
    required int count,
    String? previous,
    String? next,
    required List<UnderPromModel> results
  }) = _PromotionsModel;

  factory PromotionsModel.fromJson(Map<String, dynamic> json) =>
      _$PromotionsModelFromJson(json);
}
