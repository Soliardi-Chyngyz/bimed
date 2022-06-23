import 'package:bimed/src/ui/navigation_bar/tab_navigator_routes.dart';
import 'package:bimed/src/ui/screens/category/CategoriesScreen.dart';
import 'package:bimed/src/ui/screens/menu/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../screens/qr/QRScreen.dart';
import 'bottom_navigation.dart';

class NavBar extends HookWidget {
  static const routeName = '/NavBar';
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final barSize = useValueNotifier(60.0);
    var currentTab = useValueNotifier(TabItem.home);

    final navigatorKeys = {
      TabItem.menu: GlobalKey<NavigatorState>(),
      TabItem.home: GlobalKey<NavigatorState>(),
      TabItem.qr: GlobalKey<NavigatorState>(),
      TabItem.category: GlobalKey<NavigatorState>(),
      TabItem.cart: GlobalKey<NavigatorState>(),
    };

    void _selectTab(TabItem tabItem) {
      if (tabItem == currentTab.value) {
        // pop to first route
         navigatorKeys[tabItem]!
            .currentState!
            .popUntil((route) => route.isFirst);
      } else {
        currentTab.value = tabItem;
      }
    }

    /*Future<void> initPlatformState() async {
      if (Platform.isIOS) {
        var iosInfo = await DeviceInfoPlugin().iosInfo;
        final version = iosInfo.name.replaceAll(RegExp(r'[^0-9]'), '');
        if (int.parse(version) >= 10) {
          barSize.value = 89;
        }
      }
    }*/

    Widget _buildOffstageNavigator(TabItem tabItem, String initialRoute) {
      return Offstage(
        offstage: currentTab.value != tabItem,
        child: TabNavigator(
          navigatorKey: navigatorKeys[tabItem],
          tabItem: tabItem,
          initialRoute: initialRoute
        ),
      );
    }

    return HookBuilder(builder: (context) {
      final currTabListener = useValueListenable(currentTab);

      return WillPopScope(
        onWillPop: () async {
          final isFirstRouteInCurrentTab =
              !await navigatorKeys[currTabListener]!.currentState!.maybePop();
          if (isFirstRouteInCurrentTab) {
            // if not on the 'main' tab
            if (currTabListener != TabItem.home) {
              // select 'main' tab
              _selectTab(TabItem.home);
              // back button handled by app
              return false;
            }
          }
          // let system handle back button if we're on the first route
          return isFirstRouteInCurrentTab;
        },
        child: Container(
          color: Colors.white,
          child: SafeArea(
            top: false,
            child: Scaffold(
              extendBody: true,
              body: Stack(children: [
                _buildOffstageNavigator(TabItem.menu, MenuScreen.id),
                // _buildOffstageNavigator(TabItem.home, HomeScreen.id),
                _buildOffstageNavigator(TabItem.qr, QRScreen.id),
                _buildOffstageNavigator(TabItem.category, CategoriesScreen.id),
                // _buildOffstageNavigator(TabItem.cart, CartScreen.id),
              ]),
              bottomNavigationBar: BottomNavigation(
                currentTab: currTabListener,
                onSelectTab: _selectTab,
              ),
            ),
          ),
        ),
      );
    });
  }
}
