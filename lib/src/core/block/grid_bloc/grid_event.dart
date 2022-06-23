
import 'package:equatable/equatable.dart';

abstract class GridEvent<T> extends Equatable {
  final T? model;
  const GridEvent({this.model});

  @override
  List<Object?> get props => [model];
}

class TrigerredEvent extends GridEvent {
  const TrigerredEvent();
}