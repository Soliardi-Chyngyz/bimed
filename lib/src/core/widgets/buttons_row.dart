import 'package:bimed/src/core/block/base_state.dart';
// import 'package:bimed/src/ui/screens/cart/bloc/cart_bloc.dart';
// import 'package:bimed/src/ui/screens/cart/bloc/cart_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../data/model/favorite/favorite_model.dart';
import '../../ui/blocs/ItemEvent.dart';
import '../../ui/blocs/item_block.dart';
// import '../../ui/screens/home/bloc/hits_bloc.dart';
// import '../../ui/screens/home/bloc/hits_event.dart';
import '../../ui/screens/menu/bloc/menu_bloc.dart';
import '../../ui/screens/menu/bloc/menu_event.dart';
import '../../ui/screens/secondary_widgets/item_widget/bloc/horizontal_lists_bloc.dart';
import '../../ui/screens/secondary_widgets/item_widget/bloc/item_detail_event.dart';
import '../resources/colors.dart';
import '../utils/preference/preference.dart';

class ButtonsInRow extends HookWidget {
  const ButtonsInRow(this.model, this.itemType,
      {this.isDetailPage = false, Key? key})
      : super(key: key);
  final ItemModel model;
  final int itemType;
  final bool isDetailPage;

  String? separatedPrice() {
    if (model.price == null) return null;
    if (model.price.toString().length >= 4) {
      return NumberFormat('###,000', 'fr').format(model.price);
    } else {
      return model.price.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    String? price = separatedPrice();

    final isFavorite = useValueNotifier(model.inFavorite ?? false);
    final itemsCountInCart = useValueNotifier(model.countInCart ?? 0);

    useEffect(() {
      isFavorite.value = model.inFavorite ?? false;
      itemsCountInCart.value = model.countInCart ?? 0;
      return null;
    });

    isAuth() async {
      final isAuth = await Prefs().isAuthorized();
      return isAuth;
    }

    void requests() {
      Future.delayed(const Duration(milliseconds: 200), () async {
        // context.read<GridBloc>().add(const TrigerredEvent());
        final isA = await isAuth();
        if (isA) {
          // ignore: use_build_context_synchronously
          BlocProvider.of<MenuBloc>(context).add(const GetFavoriteItems(false));
        }
        // ignore: use_build_context_synchronously
        // context.read<CartBloc>().add(const GetCartDataEvent());
        // context.read<HitsBloc>().add(const GetHitsEvent());

        // ignore: use_build_context_synchronously
        context
            .read<HorizontalListsBloc>()
            .add(GetHorizontalListsEvents(model.id));
      });
    }

    void onFavoriteClick() {
        context.read<ItemBloc>().add(FavoriteEvent(model));
        requests();
        isFavorite.value = !isFavorite.value;
    }

    void onDecrementClick() async {
        context.read<ItemBloc>().add(DecrementFromCartEvent(model));
        requests();
        itemsCountInCart.value --;
    }

    void onIncrementClick() async {
      context
          .read<ItemBloc>()
          .add(IncrementToCartEvent(model, itemsCountInCart.value));
      requests();
      itemsCountInCart.value ++;
    }

    int flexCongiguration(IconData? icon1) {
      if (isDetailPage && icon1 == null) {
        return 4;
      } else {
        if (itemType == 2) {
          return 2;
        } else {
          return 0;
        }
      }
    }

    Widget outlinedButton(bool isFav, IconData? icon1, IconData? icon2,
        void Function()? onClick, Color borderColor, Color iconColor,
        [int countInCart = 0, Color backColor = Colors.white]) {
      final double width = countInCart == 0 ? 30 : 36;
      final flex = flexCongiguration(icon1);

      return Flexible(
        flex: flex,
        fit: FlexFit.tight,
        child: Container(
          height: isDetailPage ? 40 : 30,
          width: itemType == 2 ? double.infinity : width,
          decoration: BoxDecoration(
              color: backColor,
              border: Border.all(color: borderColor, width: 1),
              borderRadius:
                  BorderRadius.all(Radius.circular(isDetailPage ? 16 : 8))),
          child: Center(
            child: icon1 == null
                ? Text(
                    countInCart.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: titleColor,
                        fontSize: isDetailPage ? 18 : 12),
                  )
                : IconButton(
                    padding: const EdgeInsets.all(0),
                    iconSize: isDetailPage ? 25 : 17,
                    onPressed: onClick,
                    icon: Icon(
                      isFav == false ? icon1 : icon2,
                      color: iconColor,
                    )),
          ),
        ),
      );
    }

    likeUnlikeWidget(bool isFav) {
      return outlinedButton(isFav, Icons.favorite_border, Icons.favorite,
          onFavoriteClick, lightRed, red);
    }

    Widget cartWidget() {
      return Flexible(
        flex: itemType == 2 ? 6 : 0,
        fit: FlexFit.tight,
        child: SizedBox(
          height: 32,
          width: itemType == 2 ? double.infinity : 117,
          child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(7),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  )),
              onPressed: onIncrementClick,
              icon: SvgPicture.asset(
                'asset/icons/add_cart.svg',
                height: 17,
              ),
              label: Text(
                '$price c',
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
              )),
        ),
      );
    }

    Widget buttonsRow() {
      return IntrinsicHeight(
        child: HookBuilder(
          builder: (ctx) {
            final countInCart = useValueListenable(itemsCountInCart);
            final isFav = useValueListenable(isFavorite);

            return countInCart == 0
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      likeUnlikeWidget(isFav),
                      const SizedBox(
                        height: 0,
                        width: 4,
                      ),
                      cartWidget(),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      likeUnlikeWidget(isFav),
                      SizedBox(
                        height: 0,
                        width: isDetailPage ? 8 : 4,
                      ),
                      outlinedButton(false, Icons.remove, null,
                          onDecrementClick, light, secondaryBlackColor),
                      SizedBox(
                        height: 0,
                        width: isDetailPage ? 8 : 4,
                      ),
                      outlinedButton(false, null, null, null, light,
                          secondaryBlackColor, countInCart),
                      SizedBox(
                        height: 0,
                        width: isDetailPage ? 8 : 4,
                      ),
                      outlinedButton(false, Icons.add, null, onIncrementClick,
                          green, Colors.white, 0, green)
                    ],
                  );
          },
        ),
      );
    }

    return buttonsRow();
  }
}
