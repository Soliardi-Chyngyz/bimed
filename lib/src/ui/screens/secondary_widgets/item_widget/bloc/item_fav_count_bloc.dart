import 'package:bimed/src/core/block/base_state.dart';
import 'package:bimed/src/data/repositories/item_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'item_detail_event.dart';

class ItemFavCartBloc extends Bloc<ItemDetailEvent, BaseState> {
  ItemFavCartBloc(this._itemRepository) : super(const BaseState.loading()) {
    // on<GetItemStateEvent>(_onGetItemFavCartEvent);
  }
  final ItemRepository _itemRepository;

  /*void _onGetItemFavCartEvent(GetItemStateEvent event, Emitter<BaseState> emit) async {
    final data = await _itemRepository.(event.model);

    if (data is DataFailed) {
      return emit(BaseState.error(data.error));
    }
    if (data is DataSuccess) {
      return emit(BaseState.done(data.data?.similarProducts));
    }
  }*/
}
