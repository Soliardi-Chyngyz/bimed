import 'package:bimed/src/ui/screens/category/CategoriesScreen.dart';
import 'package:bimed/src/ui/screens/qr/QRScreen.dart';
import 'package:bimed/src/ui/screens/menu/menu_page.dart';
import 'package:flutter/material.dart';

import 'bottom_navigation.dart';

class TabNavigator extends StatelessWidget {
  const TabNavigator(
      {Key? key,
      required this.navigatorKey,
      required this.tabItem,
      required this.initialRoute})
      : super(key: key);
  final GlobalKey<NavigatorState>? navigatorKey;
  final TabItem tabItem;
  final String initialRoute;

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      MenuScreen.id: (context) => const MenuScreen(),
      // HomeScreen.id: (context) => const HomeScreen(),
      QRScreen.id: (context) => const QRScreen(),
      CategoriesScreen.id: (context) => const CategoriesScreen(null, null),
      // CartScreen.id: (context) => const CartScreen(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: initialRoute,
      onGenerateRoute: (routeSettings) {
        return routeSettings.name == '/'
            ? null
            : MaterialPageRoute(
                builder: (context) =>
                    routeBuilders[routeSettings.name]!(context),
              );
      },
    );
  }
}
