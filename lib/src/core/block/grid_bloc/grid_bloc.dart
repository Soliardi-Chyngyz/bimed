
import 'package:bimed/src/core/block/base_state.dart';
import 'package:bimed/src/core/block/grid_bloc/grid_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GridBloc extends Bloc<GridEvent, BaseState> {

  GridBloc() : super(const BaseState.loading()) {
    on<TrigerredEvent>(_onTrigerredEvent);
  }

  void _onTrigerredEvent(TrigerredEvent event, Emitter<BaseState> emit) {
    emit(const BaseState.done(null));
  }
}