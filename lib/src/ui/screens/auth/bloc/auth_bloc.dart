import 'package:bimed/src/core/resources/data_state.dart';
import 'package:bimed/src/data/model/auth_confirm_model/auth_confirm.dart';
import 'package:bimed/src/data/model/auth_model/auth_models.dart';
import 'package:bimed/src/data/repositories/auth_repository_impl.dart';
import 'package:bimed/src/ui/screens/auth/enter/auth_view.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepositoryImpl _repositoryImpl;

  AuthBloc(this._repositoryImpl) : super(const AuthState.unknown()) {
    on<GetSmsCode>(_onGetSmsCode);
    on<AuthRegister>(_onAuthRegister);
    on<AuthConfirm>(_onAuthConfirm);
  }

  void _onGetSmsCode(GetSmsCode event, Emitter<AuthState> emit) async {
    final data = await _repositoryImpl.smsRequest(event.phone!);

    if (data is DataSuccess) {
      return emit(AuthState.done(data.data));
    }

    if (data is DataFailed) {
      return emit(AuthState.error(data.error!));
    }
  }

  void _onAuthRegister(AuthRegister event, Emitter<AuthState> emit) async {
    final data = await _repositoryImpl.postRegister(event.model!);

    if (data is DataSuccess) {
      return emit(AuthState.done(data.data));
    }

    if (data is DataFailed) {
      return emit(AuthState.error(data.error));
    }
  }

  void _onAuthConfirm(AuthConfirm event, Emitter<AuthState> emit) async {
    final data = await _repositoryImpl.authConfirm(event.model);

    if (data is DataSuccess) {
      return emit(AuthState.done(data.data));
    }

    if (data is DataFailed) {
      return emit(AuthState.error(data.error));
    }
  }
}
