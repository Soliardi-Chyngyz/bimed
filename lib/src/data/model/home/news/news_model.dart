
import 'package:freezed_annotation/freezed_annotation.dart';

import 'news_item_model.dart';

part 'news_model.freezed.dart';
part 'news_model.g.dart';

@freezed
class NewsModel with _$NewsModel {
  factory NewsModel({
    required int count,
    String? previous,
    String? next,
    required List<NewsItemModel> results
}) = _NewsModel;

factory NewsModel.fromJson(Map<String, dynamic> json) =>
_$NewsModelFromJson(json);
}