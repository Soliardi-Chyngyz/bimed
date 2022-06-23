import 'package:bimed/src/core/widgets/popup_menu.dart';
import 'package:bimed/src/data/model/favorite/favorite_model.dart';
import 'package:equatable/equatable.dart';

abstract class ItemEvent<T, R> extends Equatable {
  final T? model;
  final R? object;
  const ItemEvent({this.model, this.object});

  @override
  List<Object?> get props => [model, object];
}

class GetResult extends ItemEvent {
  const GetResult(Map<String, dynamic> map) : super(model: map);
}

class FavoriteEvent extends ItemEvent {
  const FavoriteEvent(ItemModel model) : super(model: model);
}

class DecrementFromCartEvent extends ItemEvent {
  const DecrementFromCartEvent(ItemModel model) : super(model: model);
}

class IncrementToCartEvent extends ItemEvent {
  const IncrementToCartEvent(ItemModel model, int value) :super(model: model, object: value);
}

class AddToCartEvent extends ItemEvent {
  const AddToCartEvent(int? id) : super(model: id);
}

class RemoveFromCartEvent extends ItemEvent {
  const RemoveFromCartEvent(int? id) : super(model: id);
}

class FilterEvent extends ItemEvent {
  const FilterEvent(FilterOptions value) : super(model: value);
}