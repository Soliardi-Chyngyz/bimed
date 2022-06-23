import 'package:bimed/src/configs/custom_router.dart';
import 'package:bimed/src/configs/route_paths.dart';
import 'package:bimed/src/core/extenstions/custom_view.dart';
import 'package:bimed/src/core/utils/preference/preference.dart';
import 'package:bimed/src/core/widgets/buttons_row.dart';
import 'package:bimed/src/ui/screens/menu/bloc/menu_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../data/model/favorite/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ui/blocs/ItemEvent.dart';
import '../../ui/blocs/item_block.dart';
import '../../ui/screens/menu/bloc/menu_event.dart';
import '../../ui/screens/secondary_widgets/item_widget/bloc/horizontal_lists_bloc.dart';
import '../../ui/screens/secondary_widgets/item_widget/bloc/item_detail_event.dart';
import '../extenstions/dart_extentions.dart';
import '../resources/colors.dart';
import '../utils/constants.dart';

class Item extends HookWidget {
  const Item(this.model, this.isFavoritePage, this.itemType,
      {this.isHorizontal = false, this.isCartShop = false, required this.k})
      : super(key: k);
  final Key k;
  final ItemModel model;
  final int itemType;
  final bool isFavoritePage;
  final bool isHorizontal;
  final bool isCartShop;

  String? logo() {
    if (model.image == null || model.image!.isEmpty) return null;
    return '${model.image}';
  }

  @override
  Widget build(BuildContext context) {
    String? price = separatedPrice(model.price);
    String? photo = logo();
    final isLoading = useValueNotifier(false);

    Widget image() {
      return photo != null
          ? FadeInImage.assetNetwork(
              placeholder: 'asset/medicine.png',
              image: photo,
            )
          : Image.asset('asset/medicine.png');
    }

    isAuth() async {
      final isAuth = await Prefs().isAuthorized();
      return isAuth;
    }

    void requests() {
      Future.delayed(const Duration(milliseconds: 200), () async {
        final isA = await isAuth();
        if (isA) {
          // ignore: use_build_context_synchronously
          context.read<MenuBloc>().add(const GetFavoriteItems(false));
        }
        // ignore: use_build_context_synchronously
        context.read<ItemBloc>().add(RemoveFromCartEvent(model.id));
        // context.read<CartBloc>().add(const GetCartDataEvent());
        // context.read<HitsBloc>().add(const GetHitsEvent());
        // ignore: use_build_context_synchronously
        context
            .read<HorizontalListsBloc>()
            .add(GetHorizontalListsEvents(model.id));
      });
    }

    void navigateToDetailPage() {
      if (isCartShop) return;
      AppRouter.pushNested(
          context: context,
          route: AppRoutes.itemDetail,
          params: {'model': model});
    }

    void onDeleteItemFromCart() {
      if (!isCartShop) return;
      isLoading.value = true;
      /*context
          .read<CartBloc>()
          .add(DeleteItemEvent(model.cartItemId ?? model.id));
      requests();*/
    }

    Widget mainBody() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (itemType == 2) image(),
          const SizedBox(height: 6),
          Text(
            model.name,
            maxLines: 3,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: secondaryBlackColor,
                fontSize: 14.0,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 8),
          if (isHorizontal) const Spacer(),
          Text(
            '$price c',
            style: const TextStyle(
                color: secondaryBlackColor,
                fontSize: 11.0,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.bottomCenter,
            child: HookBuilder(builder: (ctx) {
              final isLoad = useValueListenable(isLoading);
              return isLoad ? const CircularProgressIndicator() : ButtonsInRow(model, itemType, key: k);
            }),
          )
        ],
      );
    }

    return GestureDetector(
      onTap: navigateToDetailPage,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0,
        child: Padding(
            padding: EdgeInsets.all(itemType == 1 ? 12 : 16),
            child: itemType == 1
                ? Row(
                    children: [
                      Flexible(
                          flex: 2,
                          child: Column(
                            children: [
                              image(),
                              if (isCartShop) const SizedBox(height: 9),
                              if (isCartShop)
                                HookBuilder(builder: (ctx) {
                                  final isLoad = useValueListenable(isLoading);
                                  return isLoad
                                      ? const SizedBox.shrink()
                                      : GestureDetector(
                                          onTap: onDeleteItemFromCart,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              SvgPicture.asset('asset/icons/trash.svg'),
                                              const Text('Удалить')
                                            ],
                                          ),
                                        );
                                })
                            ],
                          )),
                      Flexible(
                          flex: 4,
                          child: Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: mainBody())),
                    ],
                  )
                : mainBody()),
      ),
    );
  }
}
