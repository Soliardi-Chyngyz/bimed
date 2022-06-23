import 'package:bimed/src/core/block/base_state.dart';
import 'package:bimed/src/core/resources/data_state.dart';
import 'package:bimed/src/ui/screens/secondary_widgets/item_widget/bloc/item_detail_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/model/favorite/favorite_model.dart';
import '../../../../../data/repositories/item_repository.dart';

class HorizontalListsBloc extends Bloc<ItemDetailEvent, BaseState> {
  final ItemRepository _itemRepository;

  HorizontalListsBloc(this._itemRepository) : super(const BaseState.loading()) {
    on<GetHorizontalListsEvents>(_onGetHorizontalListsEvents);
  }

  final List<ItemModel> list = [];

  void _onGetHorizontalListsEvents(
      GetHorizontalListsEvents event, Emitter<BaseState> emit) async {
    if (event.model is List<ItemModel> && event.model != null) {
      return emit(BaseState.done(event.model));
    }

    if (event.model is int) {
      final data = await _itemRepository.getDetailInfo(event.model);

      if (data is DataFailed) {
        return emit(BaseState.error(data.error));
      }
      if (data is DataSuccess) {
        return emit(BaseState.done(data.data?.similarProducts));
      }
    }
  }
}
