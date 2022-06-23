import 'package:badges/badges.dart';
import 'package:bimed/src/core/block/badge_cubit.dart';
import 'package:bimed/src/core/block/grid_bloc/grid_bloc.dart';
import 'package:bimed/src/data/api/auth_api.dart';
import 'package:bimed/src/data/network/dio_service.dart';
import 'package:bimed/src/data/network/dio_service_no_auth.dart';
import 'package:bimed/src/data/repositories/auth_repository_impl.dart';
import 'package:bimed/src/data/repositories/category_repository.dart';
import 'package:bimed/src/data/repositories/home_repository.dart';
import 'package:bimed/src/data/repositories/item_repository.dart';
import 'package:bimed/src/data/repositories/menu_repository_impl.dart';
import 'package:bimed/src/ui/blocs/confirm_cubit.dart';
import 'package:bimed/src/ui/blocs/item_block.dart';
import 'package:bimed/src/ui/blocs/main_bloc.dart';
import 'package:bimed/src/ui/screens/auth/bloc/auth_bloc.dart';
import 'package:bimed/src/ui/screens/category/bloc/category_bloc.dart';
import 'package:bimed/src/ui/screens/menu/bloc/menu_bloc.dart';
import 'package:bimed/src/ui/screens/qr/bloc/qr_bloc.dart';
import 'package:bimed/src/ui/screens/secondary_widgets/notifications/bloc/notif_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../../ui/screens/secondary_widgets/item_widget/bloc/horizontal_lists_bloc.dart';
import '../../ui/screens/secondary_widgets/item_widget/bloc/item_detail_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio client
  injector.registerSingleton<Dio>(Dio());

  // dio
  injector.registerLazySingleton(() => DioService());
  injector.registerLazySingleton(() => DioServiceNoAuth());

  // Api
  injector.registerSingleton<AuthAPI>(AuthAPI(injector()));

  // Blocs
  injector.registerFactory<MainCubit>(() => MainCubit());
  injector.registerFactory<AuthBloc>(() => AuthBloc(injector()));
  injector.registerLazySingleton<MenuBloc>(() => MenuBloc(injector()));
  injector.registerFactory<QrBloc>(() => QrBloc(injector()));
  injector.registerFactory<ItemBloc>(() => ItemBloc(injector()));
  // injector.registerFactory<HomeBloc>(() => HomeBloc(injector()));
  // injector.registerFactory<HitsBloc>(() => HitsBloc(injector()));
  injector.registerFactory<CategoryBloc>(() => CategoryBloc(injector()));
  injector.registerFactory<GridBloc>(() => GridBloc());
  injector.registerFactory<ItemDetailBloc>(() => ItemDetailBloc(injector()));
  injector.registerLazySingleton<HorizontalListsBloc>(() => HorizontalListsBloc(injector()));
  // injector.registerLazySingleton<CartBloc>(() => CartBloc(injector(), injector()));
  // injector.registerLazySingleton<OrderBloc>(() => OrderBloc(injector()));
  injector.registerLazySingleton<NotificationBloc>(() => NotificationBloc(injector()));

  // Cubits
  injector.registerFactory<ConfirmCubit>(() => ConfirmCubit());
  injector.registerFactory<BadgeCubit>(() => BadgeCubit());

  // Repositories
  injector
      .registerSingleton<AuthRepositoryImpl>(AuthRepositoryImpl(injector()));
  injector.registerSingleton<MenuRepository>(MenuRepository(injector()));
  injector.registerSingleton<ItemRepository>(ItemRepository(injector()));
  injector.registerSingleton<HomeRepository>(HomeRepository(injector()));
  injector.registerSingleton<CategoryRepository>(CategoryRepository(injector()));
}
