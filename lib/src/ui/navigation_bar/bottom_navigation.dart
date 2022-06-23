import 'package:badges/badges.dart';
import 'package:bimed/src/core/block/badge_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/resources/colors.dart';
import '../../core/utils/bimedIcons.dart';
import '../../core/utils/sizes.dart';

enum TabItem { menu, home, qr, category, cart }

const Map<TabItem, String> tabName = {
  TabItem.menu: 'Меню',
  TabItem.home: 'Главная',
  TabItem.qr: 'QR code',
  TabItem.category: 'Категории',
  TabItem.cart: 'Корзина',
};

class BottomNavigation extends StatelessWidget {
  const BottomNavigation(
      {Key? key, required this.currentTab, required this.onSelectTab})
      : super(key: key);

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade100, offset: const Offset(0, -2.5)),
          ],
        ),
        child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              unselectedItemColor: secondaryGray,
              selectedItemColor: blue,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              items: [
                _buildActiveItem(TabItem.menu, BimedIcons.menu),
                _buildItem(TabItem.home, BimedIcons.home),
                _buildItem(TabItem.qr, BimedIcons.qrCode),
                _buildItem(TabItem.category, BimedIcons.categories),
                _buildCartShop(TabItem.cart, BimedIcons.shoppingCart),
              ],
              onTap: (index) => onSelectTab(
                TabItem.values[index],
              ),
              currentIndex: currentTab.index,
            )));
  }

  BottomNavigationBarItem _buildCartShop(TabItem tabItem, IconData iconData) {
    return BottomNavigationBarItem(
        label: tabName[tabItem],
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: BlocBuilder<BadgeCubit, int>(builder: (ctx, state) {
            return state <= 0
                ? Icon(iconData, size: iconSize)
                : Badge(
                    position: BadgePosition.topEnd(top: -10),
                    animationDuration: const Duration(milliseconds: 300),
                    animationType: BadgeAnimationType.slide,
                    badgeContent: Text(
                      state.toString(),
                      style: Theme.of(ctx).textTheme.bodyText2?.copyWith(color: Colors.white, fontSize: 10),
                    ),
                    child: Icon(iconData, size: iconSize),
                  );
          }),
        ));
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem, IconData iconData) {
    return BottomNavigationBarItem(
      backgroundColor: Colors.transparent,
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Icon(iconData, size: iconSize),
      ),
      label: tabName[tabItem],
    );
  }

  BottomNavigationBarItem _buildActiveItem(TabItem tabItem, IconData iconData) {
    return BottomNavigationBarItem(
        backgroundColor: Colors.transparent,
        activeIcon: SvgPicture.asset('asset/icons/close.svg',
            semanticsLabel: 'Acme Logo'),
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Icon(
            iconData,
            size: iconSize,
          ),
        ),
        label: tabName[tabItem]);
  }
}
