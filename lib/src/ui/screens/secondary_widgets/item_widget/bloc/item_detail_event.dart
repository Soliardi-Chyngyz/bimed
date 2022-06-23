import 'package:equatable/equatable.dart';

abstract class ItemDetailEvent<T> extends Equatable {
  final T? model;
  const ItemDetailEvent({this.model});

  @override
  List<Object?> get props => [model];
}

class GetDetailInfoEvent extends ItemDetailEvent {
  const GetDetailInfoEvent(int? id) : super(model: id);
}

class GetHorizontalListsEvents<T> extends ItemDetailEvent {
  const GetHorizontalListsEvents(T data) : super(model: data);
}

class GetItemStateEvent extends ItemDetailEvent {
  const GetItemStateEvent(int id) : super(model: id);
}





