import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/resources/colors.dart';

class CustomTabBarWidget extends HookWidget {
  const CustomTabBarWidget({
    Key? key,
    required TabController? tabController,
    required this.firstTabTitle,
    required this.secondTabTitle,
    this.fromBasket,
  })  : _tabController = tabController,
        super(key: key);

  final TabController? _tabController;
  final String firstTabTitle;
  final String secondTabTitle;
  final bool? fromBasket;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
        height: 40,
        decoration: BoxDecoration(
          color: light,
          borderRadius: BorderRadius.circular(
            12.0,
          ),
        ),
        child: TabBar(
          isScrollable: true,
          unselectedLabelColor: purpleDark,
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Colors.white,
          indicatorPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 3),
          controller: _tabController,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(
              8.0,
            ),
            color: blue,
          ),
          tabs: [
            // first tab [you can add an icon using the icon property]
            SizedBox(
              width: width / 2,
              child: Tab(
                text: firstTabTitle,
              ),
            ),

            // second tab [you can add an icon using the icon property]
            SizedBox(
              width: width / 4,
              child: Tab(
                text: secondTabTitle,
              ),
            ),
          ],
          onTap: (index){
            if(index == 1 && fromBasket!=null){
              // BlocProvider.of<OrderingBloc>(context).add(OrderingGetItemListEvent(offset: 0));
            }
          },
        ));
  }
}