import 'package:bimed/src/core/block/base_state.dart';
import 'package:bimed/src/core/block/search/search_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBloc extends Bloc<BaseEvent, BaseState> {
  SearchBloc() :  super(const BaseState.loading()) {
    on<SearchTextFieldEvent>(_onSearchTextFieldEvent);
  }

  void _onSearchTextFieldEvent(SearchTextFieldEvent event, Emitter<BaseState> emit) async {

  }
}