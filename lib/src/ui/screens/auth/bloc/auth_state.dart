part of 'auth_bloc.dart';

class AuthState<T> extends Equatable {
  final T? responseValue;
  final T? error;
  final AuthStatus status;

  const AuthState._(
      {this.status = AuthStatus.unknown, this.responseValue, this.error});

  const AuthState.unknown() : this._();

  const AuthState.done(T value)
      : this._(responseValue: value, status: AuthStatus.done);

  const AuthState.error(T error)
      : this._(error: error, status: AuthStatus.error);

  @override
  List<Object?> get props => [responseValue, error, status];
}


// abstract class AuthState extends Equatable {
//   final String? message;

//   final DioError? error;

//   const AuthState({this.message, this.error});

//   @override
//   List<Object?> get props => [message, error];
// }

// class AuthLoading extends AuthState {
//   const AuthLoading();
// }

// class AuthDone extends AuthState {
//   const AuthDone(String message) : super(message: message);
// }

// class AuthError extends AuthState {
//   const AuthError(DioError error) : super(error: error);
// }
