import 'package:freezed_annotation/freezed_annotation.dart';

import '../../favorite/favorite_model.dart';
part 'result_model.freezed.dart';
part 'result_model.g.dart';

@freezed
class ResultModel with _$ResultModel {

  factory ResultModel({
    required int count,
    int? previous,
    int? next,
    @JsonKey(name: 'num_pages') int? numPage,
    required List<ItemModel> results
    }) = _ResultModel;

  factory ResultModel.fromJson(Map<String, dynamic> json) =>
      _$ResultModelFromJson(json);
}