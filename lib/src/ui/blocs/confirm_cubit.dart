

import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmCubit extends Cubit<bool> {
  ConfirmCubit() : super(false);

  void confirmedSuccess() => emit(true);
}