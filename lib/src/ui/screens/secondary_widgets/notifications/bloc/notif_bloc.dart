import 'package:bimed/src/core/block/base_state.dart';
import 'package:bimed/src/ui/screens/secondary_widgets/notifications/bloc/notif_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/block/block_with_state.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../../../data/repositories/home_repository.dart';

class NotificationBloc extends Bloc<NotificationEvent, BaseState> {
  NotificationBloc(this._homeRepository) : super(const BaseState.loading()) {
    on<GetNotificationEvent>(_onGetNotificationEvent);
  }
  final HomeRepository _homeRepository;

  final BlocProcessState _state = BlocProcessState.idle;
  BlocProcessState get blocProcessState => _state;

  void _onGetNotificationEvent(GetNotificationEvent event, Emitter<BaseState> emit) async {
    final data = await _homeRepository.getNotifications();

    if (data is DataFailed) {
      return emit(BaseState.error(data.error));
    }
    if (data is DataSuccess) {
      return emit(BaseState.done(data.data));
    }
  }
}
