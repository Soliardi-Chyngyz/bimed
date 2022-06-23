import 'package:equatable/equatable.dart';

import '../../../../data/model/category_model/category_model.dart';

abstract class CategoryEvent<T> extends Equatable {
  final T? model;
  const CategoryEvent({this.model});

  @override
  List<Object?> get props => [model];
}

class GetCategories extends CategoryEvent {
  const GetCategories() : super();
}

class NestedCategory extends CategoryEvent {
  const NestedCategory(List<CategoryItem> list) : super(model: list);
}

