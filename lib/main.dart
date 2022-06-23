import 'package:bimed/src/configs/custom_router.dart';
import 'package:bimed/src/configs/theme/app_theme.dart';
import 'package:bimed/src/core/block/badge_cubit.dart';
import 'package:bimed/src/core/block/grid_bloc/grid_bloc.dart';
import 'package:bimed/src/core/extenstions/custom_view.dart';
import 'package:bimed/src/ui/blocs/confirm_cubit.dart';
import 'package:bimed/src/ui/blocs/item_block.dart';
import 'package:bimed/src/ui/navigation_bar/nav_bar.dart';
import 'package:bimed/src/ui/screens/auth/bloc/auth_bloc.dart';
import 'package:bimed/src/ui/screens/auth/registration.dart/success_view.dart';
import 'package:bimed/src/ui/screens/category/bloc/category_bloc.dart';
// import 'package:bimed/src/ui/screens/home/bloc/hits_bloc.dart';
// import 'package:bimed/src/ui/screens/home/bloc/home_bloc.dart';
import 'package:bimed/src/ui/screens/menu/bloc/menu_bloc.dart';
import 'package:bimed/src/ui/screens/qr/bloc/qr_bloc.dart';
import 'package:bimed/src/ui/screens/secondary_widgets/item_widget/bloc/horizontal_lists_bloc.dart';
import 'package:bimed/src/ui/screens/secondary_widgets/item_widget/bloc/item_detail_bloc.dart';
import 'package:bimed/src/ui/screens/secondary_widgets/notifications/bloc/notif_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'src/configs/di/injector.dart';
import 'src/ui/blocs/main_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.remove();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: null,
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  await initializeDependencies();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<AuthBloc>(create: (_) => injector.get()),
    BlocProvider<MenuBloc>(create: (_) => injector.get()),
    BlocProvider<QrBloc>(create: (_) => injector.get()),
    // BlocProvider<CartBloc>(create: (_) => injector.get()),
    BlocProvider<MainCubit>(create: (_) => injector.get()),
    BlocProvider<ItemBloc>(create: (_) => injector.get()),
    // BlocProvider<HomeBloc>(create: (_) => injector.get()),
    // BlocProvider<HitsBloc>(create: (_) => injector.get()),
    BlocProvider<ItemDetailBloc>(create: (_) => injector.get()),
    BlocProvider<HorizontalListsBloc>(create: (_) => injector.get()),
    BlocProvider<GridBloc>(create: (_) => injector.get()),
    BlocProvider<CategoryBloc>(create: (_) => injector.get()),
    BlocProvider<ConfirmCubit>(create: (_) => injector.get()),
    BlocProvider<BadgeCubit>(create: (_) => injector.get()),
    // BlocProvider<OrderBloc>(create: (_) => injector.get()),
    BlocProvider<NotificationBloc>(create: (_) => injector.get()),
  ], child: const MyApp()));
  // const MyApp();
  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BIMED',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      // home: const NavigationScreen(),
      builder: EasyLoading.init(),
      navigatorKey: AppRouter.navKey,
      onGenerateRoute: (_) => AppRouter.generateRoute(),
      routes: {
        NavBar.routeName: (ctx) => const NavBar(),
        SuccessPage.routeName: (ctx) => const SuccessPage(),
        // ConfirmationPage.routeName: (ctx) => ConfirmationPage(),
        // SuccessPage.routeName: (_) => const SuccessPage(),
        // ProfilePage.routeName: (ctx) => ProfilePage(), // menu
        // FavoritePage.routeName: (_) => const FavoritePage(),
        // AuthPage.routeName: (_) => const AuthPage(), // auth
      },
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [Locale('en'), Locale('ru', 'RU')],
    );
  }
}

// flutter pub run build_runner build --delete-conflicting-outputs
