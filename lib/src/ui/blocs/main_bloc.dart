

import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';

class MainCubit extends Cubit<bool> {
  MainCubit() : super(false);

  void offstage(bool value) => emit(value);

}