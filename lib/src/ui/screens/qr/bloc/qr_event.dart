import 'package:equatable/equatable.dart';

abstract class QrEvent<T> extends Equatable {
  final T? model;
  const QrEvent({this.model});

  @override
  List<Object?> get props => [model];
}

class GetProfileEvent extends QrEvent {
  const GetProfileEvent();
}