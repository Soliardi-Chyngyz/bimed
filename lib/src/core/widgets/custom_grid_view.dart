import 'package:bimed/src/data/model/favorite/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'common_item_widget.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView(this.data,
      {this.isBottomZero = false,
      this.scrollPhysics = const NeverScrollableScrollPhysics(),
      this.isFavoritePage = false,
      this.top = 16,
        this.bottom = 16,
        this.isCartShop = false,
      this.crossAxisCount = 2,
      this.scrollDirection = Axis.vertical,
      Key? key})
      : super(key: key);
  final List<ItemModel> data;
  final bool isBottomZero;
  final ScrollPhysics scrollPhysics;
  final bool isFavoritePage;
  final bool isCartShop;

  final double top;
  final double bottom;
  final int crossAxisCount;
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
        shrinkWrap: true,
        scrollDirection: scrollDirection,
        physics: scrollPhysics,
        padding: EdgeInsets.only(
            top: top,
            left: 16,
            right: 16,
            bottom: !isBottomZero ? kBottomNavigationBarHeight + bottom : bottom),
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemCount: data.length,
        itemBuilder: (ctx, index) {
          return Item(
            k: ValueKey(data[index].id),
            data[index],
            isFavoritePage,
            crossAxisCount,
            isCartShop: isCartShop,
          );
        });
  }
}

class HorrizontalListView extends HookWidget {
  const HorrizontalListView(this.data, {Key? key}) : super(key: key);
  final List<ItemModel>? data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 290,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: data!.length,
            itemBuilder: (ctx, index) {
          return SizedBox(
            width: 160,
            child: Item(
              k: ValueKey(data![index].id),
              data![index],
              false,
              2,
              isHorizontal: true,
            ),
          );
        })

    );
  }
}
