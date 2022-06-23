import 'package:bimed/src/core/block/base_state.dart';
import 'package:bimed/src/core/extenstions/db_list.dart';
import 'package:bimed/src/core/widgets/popup_menu.dart';
import 'package:bimed/src/data/model/category_model/response_category/result_model.dart';
import 'package:bimed/src/data/repositories/item_repository.dart';
import 'package:bimed/src/ui/blocs/ItemEvent.dart';
import 'package:dio/src/dio_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/resources/data_state.dart';
import '../../data/model/favorite/favorite_model.dart';

enum BlocProcessState {
  busy,
  idle,
}

class ItemBloc extends Bloc<ItemEvent, BaseState> {
  final ItemRepository _itemRepository;

  ItemBloc(this._itemRepository) : super(const BaseState.loading()) {
    on<GetResult>(_onGetResult);
    on<FavoriteEvent>(_onFavorite);
    on<DecrementFromCartEvent>(_onDecrementFromCartEvent);
    on<IncrementToCartEvent>(_onIncrementToCartEvent);
    on<RemoveFromCartEvent>(_onRemoveFromCartEvent);
    on<FilterEvent>(_onFilterEvent);
  }

  final BlocProcessState _state = BlocProcessState.idle;
  BlocProcessState get blocProcessState => _state;

  int _page = 1;

  void setPageOne() => _page = 1;

  final List<ItemModel> _list = [];
  bool isAccessProperty = true;

  void _onFilterEvent(FilterEvent event, Emitter<BaseState> emit) async {
    if (_list.isEmpty) return;
    List<ItemModel> newList = [];

    final filterOptions = event.model as FilterOptions;
    switch (filterOptions) {
      case FilterOptions.maxCost:
        _list.sort((a, b) => b.price!.compareTo(a.price!));
        break;
      case FilterOptions.minCost:
        _list.sort((a, b) => a.price!.compareTo(b.price!));
        break;
      case FilterOptions.alphabetAZ:
        _list.sort((a, b) => a.name.compareTo(b.name));
        break;
      case FilterOptions.alphabetZA:
        _list.sort((a, b) => b.name.compareTo(a.name));
        break;
      case FilterOptions.startNew:
        break;
      case FilterOptions.startOld:
        break;
      case FilterOptions.hits:
        break;
    }
    for (var element in _list) {
      newList.add(element);
    }
    return emit(BaseState.done(newList));
  }

  void _onGetResult(GetResult event, Emitter<BaseState> emit) async {
    final Map<String, dynamic> map = event.model;
    if (map['isFirst'] != null || map['isFirst'] == false) {
      _page = 1;
      isAccessProperty = true;
      // _list.clear();
    }

    if (!isAccessProperty) return;

    map['page'] = _page;
    final data = await _itemRepository.getResult(map);

    if (data is DataSuccess) {
      if (_page == 1) {
        _list.clear();
      }
      _page = data.data?.next ?? 1;

      if (data.data!.results.isNotEmpty) {
        _list.addAll(data.data!.results);
        List<ItemModel> newList = [];
        for (var element in _list) {
          newList.add(element);
        }
        isAccessProperty = isAccess(data);

        return emit(BaseState.done(newList));
      }
    }
    if (data is DataFailed) {
      return emit(BaseState.error(data.error));
    }
  }

  bool isAccess(DataState<ResultModel, DioError> data) {
    if (data.data?.previous != null && data.data?.next == null ||
        data.data?.previous == null && data.data?.next == null) {
      // _list.clear();
      return false;
    }
    return true;
  }

  void _onFavorite(FavoriteEvent event, Emitter<BaseState> emit) async {
    final data = await _itemRepository.setFavoriteUnfavorite(event.model);

    if (data is DataFailed) {
      return emit(BaseState.error(data.error));
    }
    if (data is DataSuccess) {
      if (data.data == DataType.remote) {
        List<ItemModel> newList = [];
        for (var element in _list) {
          final m = event.model as ItemModel;
          if (element.id == m.id) {
            final fav = element.inFavorite ?? false;
            newList.add(ItemModel(
              id: element.id,
              name: element.name,
              image: element.image,
              price: element.price,
              inCart: element.inCart,
              countInCart: element.countInCart,
              inFavorite: !fav,
              byPrescription: element.byPrescription,
              productType: element.productType,
            ));
          } else {
            newList.add(element);
          }
        }
        _list.clear();
        _list.addAll(newList);
        return emit(BaseState.done(newList));
      }

      if (data.data == DataType.database) {
        final list = await databaseSortedList(_list);
        if (list != null) {
          _list.clear();
          _list.addAll(list);
          return emit(BaseState.done(list));
        }
      }
    }
  }

  void _onDecrementFromCartEvent(
      DecrementFromCartEvent event, Emitter<BaseState> emit) async {
    final data = await _itemRepository.decrementCart(event.model);

    if (data is DataSuccess) {
      if (data.data == DataType.remote) {
        List<ItemModel> newList = [];
        final eventModel = event.model as ItemModel;
        for (var element in _list) {
          if (element.id == eventModel.id) {
            newList.add(ItemModel(
              id: element.id,
              name: element.name,
              image: element.image,
              price: element.price,
              inCart: element.inCart,
              countInCart: element.countInCart! - 1,
              inFavorite: element.inFavorite,
              byPrescription: element.byPrescription,
              productType: element.productType,
            ));
          } else {
            newList.add(element);
          }
        }
        _list.clear();
        _list.addAll(newList);
        return emit(BaseState.done(newList));
      }

      if (data.data == DataType.database) {
        final list = await databaseSortedList(_list);
        if (list != null && list.isNotEmpty) {
          _list.clear();
          _list.addAll(list);
          return emit(BaseState.done(list));
        }
      }
    }
  }

  void _onIncrementToCartEvent(
      IncrementToCartEvent event, Emitter<BaseState> emit) async {
    final DataState data;
    if (event.object as int == 0) {
      data = await _itemRepository.addToCart(event.model);
    } else {
      data = await _itemRepository.incrementCart(event.model);
    }

    if (data is DataFailed) {
      return emit(BaseState.error(data.error));
    }

    if (data is DataSuccess) {
      if (data.data == DataType.remote) {
        List<ItemModel> newList = [];
        final eventM = event.model as ItemModel;
        for (var element in _list) {
          if (element.id == eventM.id) {
            final c = element.countInCart ?? 0;
            newList.add(ItemModel(
              id: element.id,
              name: element.name,
              image: element.image,
              price: element.price,
              inCart: element.inCart,
              countInCart: c + 1,
              inFavorite: element.inFavorite,
              byPrescription: element.byPrescription,
              productType: element.productType,
            ));
          } else {
            newList.add(element);
          }
        }
        _list.clear();
        _list.addAll(newList);
        return emit(BaseState.done(newList));
      }

      if (data.data == DataType.database) {
        final list = await databaseSortedList(_list);
        if (list != null && list.isNotEmpty) {
          _list.clear();
          _list.addAll(list);
          return emit(BaseState.done(list));
        }
      }
    }
  }

  void _onAddToCartEvent(AddToCartEvent event, Emitter<BaseState> emit) async {
    final data = await _itemRepository.addToCart(event.model);

    if (data is DataFailed) {
      return emit(BaseState.error(data.error));
    }
  }

  void _onRemoveFromCartEvent(
      RemoveFromCartEvent event, Emitter<BaseState> emit) async {
    if (_list.isEmpty) return;

    List<ItemModel> newList = [];
    for (var element in _list) {
      if (element.id == event.model) {
        newList.add(ItemModel(
          id: element.id,
          name: element.name,
          image: element.image,
          price: element.price,
          inCart: element.inCart,
          countInCart: 0,
          inFavorite: element.inFavorite,
          byPrescription: element.byPrescription,
          productType: element.productType,
        ));
      } else {
        newList.add(element);
      }
    }
    _list.clear();
    _list.addAll(newList);
    return emit(BaseState.done(newList));
  }
}
