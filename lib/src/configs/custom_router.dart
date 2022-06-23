import 'dart:async';

import 'package:bimed/src/ui/screens/auth/enter/auth_view.dart';
import 'package:bimed/src/ui/screens/auth/enter/confirmation_view.dart';
import 'package:bimed/src/ui/screens/auth/registration.dart/registration_view.dart';
// import 'package:bimed/src/ui/screens/cart/order/order_screen.dart';
import 'package:bimed/src/ui/screens/category/CategoriesScreen.dart';
import 'package:bimed/src/ui/screens/menu/about_company_page.dart';
import 'package:bimed/src/ui/screens/menu/favorite_page.dart';
import 'package:bimed/src/ui/screens/menu/filials_page.dart';
import 'package:bimed/src/ui/screens/menu/help_page.dart';
import 'package:bimed/src/ui/screens/menu/news_page.dart';
import 'package:bimed/src/ui/screens/menu/orders_history_page.dart';
import 'package:bimed/src/ui/screens/menu/profile_page.dart';
import 'package:bimed/src/ui/screens/secondary_widgets/notifications/notifications_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui/navigation_bar/nav_bar.dart';
import '../ui/screens/menu/contacts_page.dart';
import '../ui/screens/secondary_widgets/item_widget/item_detail.dart';
import '../ui/screens/secondary_widgets/result_search_or_category/result_page.dart';
import 'route_paths.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
  static NavigatorState get _state => navKey.currentState!;
  static AppRoutes? rememberRout;

  get getKey => navKey;

  static push({
    required BuildContext context,
    required AppRoutes route,
    int? pageIndexRoute,
    Map<String, Object>? params,
    bool? navBar,
    FutureOr<dynamic> Function(dynamic value)? then,
  }) async {
    final routeContent = await _buildContent(
      _routeContent(
          context: context,
          route: route,
          params: params,
          pageIndexRoute: pageIndexRoute),
    );
    Navigator.of(navKey.currentState!.context)
        .push(MaterialPageRoute(builder: (context) => routeContent))
        .then(then ?? (value) => null);
    // .whenComplete(() => {navBar != null ? BlocProvider.of<MainBloc>(context).add(MainNavBarVisibleEvent(isVisible: navBar)) : null});
  }

  static void pushNested({
    required BuildContext context,
    required AppRoutes route,
    Map? params,
    bool pushType = false,
  }) {
    final Widget routeContent = _routeContent(context: context, route: route, params: params, pageIndexRoute: null, );
    // if (rememberRout != route) {
      Navigator.of(context)
          .push(pushType
          ? MaterialPageRoute(builder: (context) => routeContent)
          : CupertinoPageRoute(builder: (context) => routeContent))
          .then((value) => rememberRout = null);
      rememberRout = route;
    // }
  }

  static void route({
    required BuildContext context,
    required AppRoutes route,
    int? pageIndexRoute,
    Map<String, Object?>? params,
    bool? navBar,
    FutureOr<dynamic> Function(dynamic value)? then,
  }) async {
    rememberRout = route;
    final routeContent = await _buildContent(
      _routeContent(
          context: context,
          route: route,
          params: params,
          pageIndexRoute: pageIndexRoute),
    );

    _state
        .push(MaterialPageRoute(builder: (context) => routeContent))
        .then((value) {
      if (then != null) {
        then(value);
      }
      rememberRout = null;
    });
  }

  static void pushReplacement({
    required BuildContext context,
    required AppRoutes route,
    int? pageIndexRoute,
    Map? params,
  }) async {
    final routeContent = await _buildContent(
      _routeContent(
          context: context,
          route: route,
          params: params,
          pageIndexRoute: pageIndexRoute),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => routeContent),
    );
  }

  static void routeAndRemoveUntil(
      {required BuildContext context,
        required AppRoutes route,
        int? pageIndexRoute,
        Map? params}) async {
    final routeContent = await _buildContent(
      _routeContent(
          context: context,
          route: route,
          params: params,
          pageIndexRoute: pageIndexRoute),
    );

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => routeContent),
            (route) => false);
  }

  static Widget _routeContent({
    required BuildContext context,
    required AppRoutes route,
    Map? params,
    required int? pageIndexRoute,
  }) {
    switch (route) {
      case AppRoutes.profile:
        return profileScreen(context, params);
      case AppRoutes.favorite:
        return favoriteScreen(context, params);
      case AppRoutes.orderHistory:
        return orderHistory(context, params);
      case AppRoutes.branches:
        return branches(context, params);
      case AppRoutes.news:
        return news(context, params);
      case AppRoutes.aboutCompany:
        return aboutCompany(context, params);
      case AppRoutes.help:
        return help(context, params);
      case AppRoutes.contacts:
        return contacts(context, params);
      case AppRoutes.auth:
        return auth(context, params);
      case AppRoutes.confirmation:
        return confirmation(context, params);
      case AppRoutes.registration:
        return registration(context, params);
      case AppRoutes.category:
        return category(context, params);
      case AppRoutes.result:
        return result(context, params);
      case AppRoutes.itemDetail:
        return itemDetail(context, params);
      case AppRoutes.order:
        // return order(context, params);
      case AppRoutes.notifications:
        return notifications(context, params);
    }
  }

  static Route generateRoute() {
    return CupertinoPageRoute(builder: (_) => const NavBar());
  }

  static Future<Widget> _buildContent(content) {
    return Future.microtask(() => content);
  }


  /// Auth /
  static auth(BuildContext context, Map? params) => const AuthPage();

  static confirmation(BuildContext context, Map? params) => ConfirmationPage(params!['code'], params['phone'], codeIso: params['codeIso']);

  static registration(BuildContext context, Map? params) => RegistrationPage(params!['codeIso'], params['phone'], params['code']);

  /// Category /
  static category(BuildContext context, Map? params) => CategoriesScreen(params!['categoryItem'], params['title']);

  /// Result /
  static result(BuildContext context, Map? params) => ResultScreen(params!['title'], params['product_type'], params['category']);

  /// Item Detail /
  static itemDetail(BuildContext context, Map? params) => ItemDetail(params!['model']);

  /// Order /
  // static order(BuildContext context, Map? params) => OrderScreen(params!['model'], params['user']);

  /// Notifications/
  static notifications(BuildContext context, Map? params) => const NotificationsScreen();

  static profileScreen(BuildContext context, Map? params) => ProfilePage();

  static favoriteScreen(BuildContext context, Map? params) => const FavoritePage();

  static orderHistory(BuildContext context, Map? params) => const OrderHistoryPage();

  static branches(BuildContext context, Map? params) => const BranchesPage();

  static news(BuildContext context, Map? params) => const NewsPage();

  static aboutCompany(BuildContext context, Map? params) => const AboutCompanyPage();

  static help(BuildContext context, Map? params) => const HelpPage();

  static contacts(BuildContext context, Map? params) => const ContactsPage();


/*static stories(BuildContext context, Map? params) => StoryPageView(
    stories: params!['stories'],
    initPage: params['init_page'],
  );

  static productCollection(BuildContext context, Map? params) =>
      ProductCollection(
        categoryTitle: params!['categoryTitle'],
        productId: params['productId'],
      );

  static productDetail(BuildContext context, Map? params) => ProductDetail(
    productId: params!['product_id'],
    // categoryTitle: params!['categoryTitle'], productId: ,
  );

  static firstListCategory(BuildContext context, Map? params) =>
      CategoryListScreen(
        categoryModel: params!['category_model'],
        categoryTitle: params['category_title'],
        isFromStocks: params['is_from_stock'],
      );

  static categoryScreen(BuildContext context, Map? params) => CategoryScreen(
    categoryTitle: params!['category_title'],
    productId: params['productId'],
  );

  static detailProductInfo(
      BuildContext context, Map? params, int pageIndexRoute) =>
      DetailProductInfo(
        pageIndexRoute: pageIndexRoute,
        productId: params!['product_id'],
        index: params['index'],
        productModelItem: params['product_model'],
      );

  static reviews(BuildContext context, Map? params) => Reviews(
    productInfo: params!['title_review'],
    productId: params['productId'],
  );

  static productInfo(BuildContext context, Map? params) => ProductInfo(
    detailProduct: params!['detail_product'],
  );

  static ordering(BuildContext context, Map? params) => Ordering(
    // listCatalogModel: params!['list_catalog'],
  );

  static addNewAddress(BuildContext context, Map? params) => AddNewAddress(
    // cityList: params!['city_list'],
  );*/


}
