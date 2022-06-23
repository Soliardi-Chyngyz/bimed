import 'package:bloc/bloc.dart';

class BadgeCubit extends Cubit<int> {
  BadgeCubit() : super(0);

  void setCartShopCountItems(int count) => emit(count);
}