import 'package:bimed/src/configs/custom_router.dart';
import 'package:bimed/src/configs/route_paths.dart';
import 'package:bimed/src/core/resources/colors.dart';
import 'package:bimed/src/core/utils/preference/preference.dart';
import 'package:bimed/src/core/utils/rebuilder.dart';
import 'package:bimed/src/core/widgets/popup_menu.dart';
import 'package:bimed/src/ui/blocs/confirm_cubit.dart';
import 'package:bimed/src/ui/screens/auth/enter/auth_view.dart';
import 'package:bimed/src/ui/screens/menu/favorite_page.dart';
import 'package:bimed/src/ui/screens/menu/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../configs/route_paths.dart';
import '../../../configs/route_paths.dart';
import '../../navigation_bar/nav_bar.dart';

class MenuScreen extends HookWidget {
  const MenuScreen({Key? key}) : super(key: key);
  static const id = 'MenuScreen_id';

  @override
  Widget build(BuildContext context) {
    final listNotifier = useValueNotifier<List<ItemMenuModel>>(List.empty());
    final List<ItemMenuModel> list = [];

    void triggerList(bool value) {
      list.clear();
      if (value) {
        list.add(ItemMenuModel(
            'asset/icons/user.svg', 'Профиль', AppRoutes.profile));
        list.add(ItemMenuModel(
            'asset/icons/heart.svg', 'Избранное', AppRoutes.favorite));
        list.add(ItemMenuModel(
            'asset/icons/time.svg', 'История заказов', AppRoutes.orderHistory));
      } else {
        list.add(
            ItemMenuModel('asset/icons/user.svg', 'Войти', AppRoutes.auth));
      }
      list.add(ItemMenuModel(
          'asset/icons/filials.svg', 'Филиалы', AppRoutes.branches));
      list.add(
          ItemMenuModel('asset/icons/news.svg', 'Новости', AppRoutes.news));
      list.add(ItemMenuModel('asset/icons/about_company.svg', 'О компании',
          AppRoutes.aboutCompany));
      list.add(ItemMenuModel('asset/icons/help.svg', 'Помощь', AppRoutes.help));
      list.add(ItemMenuModel(
          'asset/icons/phone.svg', 'Контакты', AppRoutes.contacts));
      if (value) {
        list.add(ItemMenuModel('asset/icons/logout.svg', 'Выйти', null));
      }
      if (listNotifier.hasListeners) listNotifier.value = list;
    }

    void transfer(AppRoutes? routeName) {
      if (routeName == null) {
        customDialog(context, () {
          Prefs().deleteToken();
        }, subject: 'Вы точно хотите выйти из аккаунта?');
        return;
      }

      if (routeName == AppRoutes.profile || routeName == AppRoutes.auth) {
        AppRouter.route(context: context, route: routeName);
      } else {
        AppRouter.pushNested(context: context, route: routeName);
      }
    }

    void trigger() async {
      final isA = await Prefs().isAuthorized();
      triggerList(isA);
    }

    useEffect(() {
      trigger();
      return null;
    });

    return BlocListener<ConfirmCubit, bool>(
      listener: (context, isConfirmed) {
        if (isConfirmed) {
          triggerList(true);
        }
      },
      child: Scaffold(
          body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(8),
              child: HookBuilder(builder: (_) {
                final listListener = useValueListenable(listNotifier);

                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listListener.length,
                  itemBuilder: (ctx, i) => ItemMenu(listListener[i], transfer),
                );
              })),
        ],
      )),
    );
  }
}

class ItemMenu extends HookWidget {
  final ItemMenuModel model;
  final Function callback;

  const ItemMenu(this.model, this.callback, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(top: 3),
        child: SvgPicture.asset(
          model.iconRoute,
        ),
      ),
      onTap: () => callback(model.routeName),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      minLeadingWidth: 40 - 14,
      title: Text(model.title,
          style: const TextStyle(
              color: titleColor, fontWeight: FontWeight.w400, fontSize: 15)),
    );
  }
}

class ItemMenuModel {
  final String iconRoute;
  final String title;
  final AppRoutes? routeName;

  ItemMenuModel(this.iconRoute, this.title, this.routeName);
}
