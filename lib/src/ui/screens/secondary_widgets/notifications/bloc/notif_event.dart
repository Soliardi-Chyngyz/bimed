import 'package:equatable/equatable.dart';

abstract class NotificationEvent<T> extends Equatable {
  final T? model;
  const NotificationEvent({this.model});

  @override
  List<Object?> get props => [model];
}

class GetNotificationEvent extends NotificationEvent {
  const GetNotificationEvent();
}