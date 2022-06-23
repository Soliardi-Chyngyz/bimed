import 'package:bimed/src/core/block/base_state.dart';
import 'package:bimed/src/core/resources/data_state.dart';
import 'package:bimed/src/data/model/contact/contacts.dart';
import 'package:bimed/src/data/repositories/item_repository.dart';
import 'package:bimed/src/ui/screens/secondary_widgets/item_widget/bloc/item_detail_event.dart';
import 'package:dio/src/dio_error.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemDetailBloc extends Bloc<ItemDetailEvent, BaseState> {
  ItemDetailBloc(this._itemRepository) : super(const BaseState.loading()) {
    on<GetDetailInfoEvent>(_onGetDetailInfoEvent);
  }

  final ItemRepository _itemRepository;
  Contacts? _contacts;
  int? id;

  void _onGetDetailInfoEvent(
      GetDetailInfoEvent event, Emitter<BaseState> emit) async {
    emit(const BaseState.loading());
    if (event.model != null) id = event.model;
    if (id == null) return;

    final result = await Future.wait([
      _itemRepository.getDetailInfo(id!),
      if (_contacts == null) _itemRepository.getContacts(),
    ]);

    final details = result[0];
    if (_contacts == null) {
      final contacts = result[1];

      if (contacts is DataFailed) {
        emit(BaseState.error(contacts.error));
      }

      if (contacts is DataSuccess) {
        _contacts = contacts.data as Contacts?;
      }
    }

    if (details is DataFailed) {
      emit(BaseState.error(details.error));
    }

    if (details is DataSuccess) {
      final data = {
        'details': details.data,
        'contacts': _contacts,
      };
      emit(BaseState.done(data));
    }
  }
}
