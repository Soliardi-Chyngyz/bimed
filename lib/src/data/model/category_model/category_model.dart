
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryItem with _$CategoryItem{
  factory CategoryItem({
    int? id,
    required String name,
    List<CategoryItem>? children,
}) = _CategoryItem;

factory CategoryItem.fromJson(Map<String, dynamic> json) =>
_$CategoryItemFromJson(json);

}