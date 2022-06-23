import 'package:bimed/src/configs/custom_router.dart';
import 'package:bimed/src/configs/route_paths.dart';
import 'package:bimed/src/core/block/search/search_bloc.dart';
import 'package:bimed/src/core/block/search/search_event.dart';
import 'package:bimed/src/core/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

import '../extenstions/custom_view.dart';
import '../utils/preference/preference.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final String subTitle;
  final bool automaticallyImplyLeading;
  final double elevation;
  final bool isBackPress;
  final MainAxisAlignment mainAxisAlignment;

  const CustomAppBar(
      {this.title = '',
      this.subTitle = '',
      this.automaticallyImplyLeading = true,
      this.elevation = 1.0,
      this.isBackPress = true,
      this.mainAxisAlignment = MainAxisAlignment.center,
      Key? key})
      : super(key: key);

  void _popUp(BuildContext context) {
    if (isBackPress) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
          mainAxisAlignment: mainAxisAlignment,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: Theme.of(context).textTheme.headline2),
            if (subTitle.isNotEmpty)
              Text(' ($subTitle)',
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(color: secondaryGray))
          ]),
      centerTitle: true,
      leading: isBackPress
          ? IconButton(
              color: Colors.black,
              onPressed: () => _popUp(context),
              icon: const Icon(Icons.arrow_back))
          : null,
      systemOverlayStyle: const SystemUiOverlayStyle(
        // statusBarIconBrightness: Brightness.dark,
        // statusBarBrightness: Brightness.light,
        statusBarColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      automaticallyImplyLeading: automaticallyImplyLeading,
      elevation: elevation,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class SearchAppBar extends HookWidget with PreferredSizeWidget {
  final double elevation;

  const SearchAppBar({this.elevation = 1.0, Key? key}) : super(key: key);

  isAuth() async {
    final isAuth = await Prefs().isAuthorized();
    return isAuth;
  }

  @override
  Widget build(BuildContext context) {

    void request(String? value) {
      if (value == null) {
        return;
      }
      context.read<SearchBloc>().add(SearchTextFieldEvent(value));
    }

    return AppBar(
      title: Row(children: [
        Flexible(
          flex: 9,
          child: SizedBox(
            height: 40,
            child: TextField(
              onChanged: (String? value) => request(value),
              decoration: CommonStyle.textFieldStyle(
                  labelTextStr: 'Поиск',
                  icon: SvgPicture.asset('asset/icons/search.svg',
                      semanticsLabel: 'search',
                      height: 16,
                      width: 16,
                      fit: BoxFit.scaleDown)),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: IconButton(
              onPressed: () async {
                if (await isAuth()) {
                  AppRouter.pushNested(
                      context: context, route: AppRoutes.notifications);
                }
              },
              icon: SvgPicture.asset('asset/icons/notification.svg')),
        )
      ]),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      elevation: elevation,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
