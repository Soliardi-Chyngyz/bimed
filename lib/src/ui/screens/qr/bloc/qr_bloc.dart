import 'package:bimed/src/core/block/base_state.dart';
import 'package:bimed/src/ui/screens/qr/bloc/qr_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../data/repositories/menu_repository_impl.dart';

class QrBloc extends Bloc<QrEvent, BaseState> {
  QrBloc(this._menuRepository) : super(const BaseState.loading()) {
    on<GetProfileEvent>(_onGetProfile);
  }
  final MenuRepository _menuRepository;

  void _onGetProfile(GetProfileEvent event, Emitter<BaseState> emit) async {
    final data = await _menuRepository.getProfile();

    if (data is DataSuccess) {
      return emit(BaseState.done(data.data ?? ''));
    }
    if (data is DataFailed) {
      return emit(BaseState.error(data.error!));
    }
  }
}