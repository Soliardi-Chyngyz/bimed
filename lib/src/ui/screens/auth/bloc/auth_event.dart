part of 'auth_bloc.dart';

abstract class AuthEvent<T> extends Equatable {
  final String? phone;
  final T? model;
  const AuthEvent({this.phone, this.model});

  @override
  List<Object?> get props => [phone, model];
}

class GetSmsCode extends AuthEvent {
  const GetSmsCode(String phone) : super(phone: phone);
}

class AuthRegister extends AuthEvent {
  const AuthRegister(AuthModel model) : super(model: model);
}

class AuthConfirm extends AuthEvent {
  const AuthConfirm(AuthConfirmModel model) : super(model: model);
}
