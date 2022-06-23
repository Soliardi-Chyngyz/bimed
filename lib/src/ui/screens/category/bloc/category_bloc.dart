import 'dart:core';

import 'package:bimed/src/core/block/base_state.dart';
import 'package:bimed/src/data/model/category_model/category_model.dart';
import 'package:bimed/src/data/repositories/category_repository.dart';
import 'package:bimed/src/ui/screens/category/bloc/category_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/data_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, BaseState> {
  final CategoryRepository _categoryRepository;

  CategoryBloc(this._categoryRepository) : super(const BaseState.loading()) {
    on<GetCategories>(_onGetCategory);
    on<NestedCategory>(_onNestedCategory);
  }

  List<CategoryItem>? list = List.empty();
  var isFirstTimeLoaded = false;

  void _onGetCategory(GetCategories event, Emitter<BaseState> emit) async {
    final data = await _categoryRepository.getCategories();

    if (data is DataSuccess) {
      return emit(BaseState.done(data.data));
    }
    if (data is DataFailed) {
      return emit(BaseState.error(data.error));
    }
  }

  void _onNestedCategory(NestedCategory event, Emitter<BaseState> emit) async {
    return emit(BaseState.done(event.model));
  }
}
