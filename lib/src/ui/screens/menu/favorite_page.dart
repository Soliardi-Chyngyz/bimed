import 'package:bimed/src/core/block/base_state.dart';
import 'package:bimed/src/core/extenstions/custom_view.dart';
import 'package:bimed/src/core/resources/colors.dart';
import 'package:bimed/src/core/widgets/custom_grid_view.dart';
import 'package:bimed/src/data/model/favorite/favorite_model.dart';
import 'package:bimed/src/ui/screens/menu/bloc/menu_bloc.dart';
import 'package:bimed/src/ui/screens/menu/bloc/menu_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../core/block/base_state.dart';
import '../../../core/widgets/app_bar.dart';

class FavoritePage extends HookWidget {
  const FavoritePage({Key? key}) : super(key: key);
  static const routeName = '/FavoritePage';

  @override
  Widget build(BuildContext context) {
    void request(){
      EasyLoading.show();
      context.read<MenuBloc>().add(const GetFavoriteItems());
    }

    useEffect(() {
      request();
      return null;
    });

    return Scaffold(
      extendBody: false,
      appBar: const CustomAppBar(title: 'Избранное'),
      body: RefreshIndicator(
        onRefresh: () async {
          request();
          return Future<void>.delayed(const Duration(seconds: 1));
        },
        child: BlocBuilder<MenuBloc, BaseState>(builder: (context, state) {
          switch (state.status) {
            case Status.loading:
              return const SizedBox.shrink();
            case Status.done:
              if (state.responseValue is FavoritesList) {
                final data = state.responseValue as FavoritesList;

                if (data.list.isEmpty) {
                  return const Center(
                      child: Text(
                    'У вас пока нет избранных',
                    style: TextStyle(
                        color: secondaryGray,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w700),
                  ));
                } else {
                  return CustomGridView(data.list, scrollPhysics: const AlwaysScrollableScrollPhysics(), isFavoritePage: true,);
                }
              } else {
                return const SizedBox.shrink();
              }
            case Status.error:
              showSnackBar(context, state.error);
              return const SizedBox.shrink();
          }
        }),
      ),
    );
  }
}
