import 'dart:io';

import 'package:bimed/src/core/block/base_state.dart';
import 'package:bimed/src/core/resources/data_state.dart';
import 'package:bimed/src/data/repositories/item_repository.dart';
import 'package:bimed/src/data/repositories/menu_repository_impl.dart';
import 'package:bimed/src/ui/screens/menu/bloc/menu_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/model/favorite/favorite_model.dart';

class MenuBloc extends Bloc<MenuEvent, BaseState> {
  final MenuRepository _menuRepository;

  MenuBloc(this._menuRepository) : super(const BaseState.loading()) {
    on<GetProfile>(_onGetProfile);
    on<ChangeProfile>(_onChangeProfile);
    on<SetAvatar>(_onSetAvatar);
    on<GetFavoriteItems>(_onFavoriteItems);
    // on<RemoveFavorite>(_onRemoveFavorite);
  }

  // FavoritesList? list = FavoritesList(List.empty(growable: true));
  /*void _onRemoveFavorite(RemoveFavorite event, Emitter<BaseState> emit) async {
    final data = await _itemRepository.setFavoriteUnfavorite(event.model);

    if (data is DataSuccess) {
      list?.list.removeWhere((element) => element.id == event.model['product'][0]);
      final FavoritesList newList = FavoritesList(List.empty(growable: true));
      for (var element in list?.list ?? []) {
        newList.list.add(element);
      }
      return emit(BaseState.done(newList));
    }
    if (data is DataFailed) {
      return emit(BaseState.error(data.error));
    }
  }*/

  void _onFavoriteItems(GetFavoriteItems event, Emitter<BaseState> emit) async {
    final data = await _menuRepository.getFavoriteItems(event.model);

    if (data is DataSuccess) {
      return emit(BaseState.done(data.data));
    }
    if (data is DataFailed) {
      return emit(BaseState.error(data.error!));
    }
  }

  void _onGetProfile(GetProfile event, Emitter<BaseState> emit) async {
    final data = await _menuRepository.getProfile();

    if (data is DataSuccess) {
      return emit(BaseState.done(data.data ?? ''));
    }
    if (data is DataFailed) {
      return emit(BaseState.error(data.error!));
    }
  }

  void _onSetAvatar(SetAvatar event, Emitter<BaseState> emit) async {
    final data = await _menuRepository.setAvatar(event.model);

    if (data is DataSuccess) {
      return emit(BaseState.done(data.data ?? ''));
    }
    if (data is DataFailed) {
      return emit(BaseState.error(data.error!));
    }
  }

  void _onChangeProfile(ChangeProfile event, Emitter<BaseState> emit) async {
    final data = await _menuRepository.changeProfile(event.model);

    if (data is DataSuccess) {
      return emit(BaseState.done(data.data ?? 'empty'));
    }

    if (data is DataFailed) {
      return emit(BaseState.error(data.error!));
    }
  }
}
