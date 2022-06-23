
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_item_model.freezed.dart';
part 'news_item_model.g.dart';

@freezed
class NewsItemModel with _$NewsItemModel {
  factory NewsItemModel({
    int? id,
    required String title,
    String? gallery,
    @JsonKey(name: 'get_short_description') String? description,
    @JsonKey(name: 'publication_date') required String publicDate,
}) = _NewsItemModel;

factory NewsItemModel.fromJson(Map<String, dynamic> json) =>
  _$NewsItemModelFromJson(json);
}