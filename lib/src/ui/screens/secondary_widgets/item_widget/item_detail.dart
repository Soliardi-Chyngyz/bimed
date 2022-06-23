import 'package:bimed/src/core/block/base_state.dart';
import 'package:bimed/src/core/resources/colors.dart';
import 'package:bimed/src/core/widgets/app_bar.dart';
import 'package:bimed/src/core/widgets/buttons_row.dart';
import 'package:bimed/src/core/widgets/custom_grid_view.dart';
import 'package:bimed/src/data/model/favorite/favorite_model.dart';
import 'package:bimed/src/data/model/item_detail_info.dart';
import 'package:bimed/src/ui/screens/secondary_widgets/item_widget/bloc/horizontal_lists_bloc.dart';
import 'package:bimed/src/ui/screens/secondary_widgets/item_widget/bloc/item_detail_event.dart';
import 'package:bimed/src/ui/screens/secondary_widgets/item_widget/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:page_slider/page_slider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/extenstions/custom_view.dart';
import '../../../../core/extenstions/dart_extentions.dart';
import '../../../../data/model/contact/contacts.dart';
import 'bloc/item_detail_bloc.dart';

class ItemDetail extends HookWidget {
  const ItemDetail(this.model, {Key? key}) : super(key: key);
  final ItemModel model;

  @override
  Widget build(BuildContext context) {
    String? price = separatedPrice(model.price);

    final scrollController = useScrollController();
    GlobalKey<PageSliderState> sliderKey = GlobalKey();
    final currentPage = useValueNotifier(1);
    final tabIndex = useValueNotifier(0);
    final tabController = useTabController(initialLength: 2);

    void _handleTabSelection() {
      tabIndex.value = tabController.index;
    }

    void request() {
      context.read<ItemDetailBloc>().add(GetDetailInfoEvent(model.id));
    }

    tabController.addListener(_handleTabSelection);
    useEffect(() {
      request();
      return () {
        sliderKey.currentState?.dispose();
      };
    });

    Widget itemInfo(ItemDetailModel model) {
      final maxLines = useValueNotifier(10);

      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Характеристики',
            style:
                Theme.of(context).textTheme.headline2?.copyWith(fontSize: 15)),
        const SizedBox(height: 8),
        const Text('Страна производителя:'),
        Text('${model.country?.name}',
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(color: secondaryBlackColor)),
        const SizedBox(
          height: 12,
        ),
        const Text('Производитель:'),
        Text('${model.manufacturer?.name}',
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(color: secondaryBlackColor)),
        const SizedBox(height: 12),
        const Text('Бренд:'),
        Text('${model.brand?.name}',
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(color: secondaryBlackColor)),
        const SizedBox(height: 12),
        Text('Беречь от детей',
            style: Theme.of(context).textTheme.bodyText2?.copyWith(color: red)),
        const SizedBox(height: 24),
        Text('Состав',
            style:
                Theme.of(context).textTheme.headline2?.copyWith(fontSize: 15)),
        const SizedBox(height: 12),
        HookBuilder(builder: (ctx) {
          final maxLine = useValueListenable(maxLines);
          return Text('${model.composition}',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(color: secondaryBlackColor),
              maxLines: maxLine,
              overflow: TextOverflow.ellipsis);
        }),
        LayoutBuilder(builder: (context, size) {
          // Build the textspan
          var span = TextSpan(
            text: model.composition,
            style: Theme.of(context).textTheme.bodyText2,
          );

          // Use a textpainter to determine if it will exceed max lines
          var tp = TextPainter(
            maxLines: maxLines.value,
            textAlign: TextAlign.left,
            textDirection: TextDirection.ltr,
            text: span,
          );
          tp.layout(maxWidth: size.maxWidth);
          var exceeded = tp.didExceedMaxLines;

          return HookBuilder(builder: (ctx) {
            final mL = useValueListenable(maxLines);

            if (exceeded && mL == 10) {
              return Column(children: [
                const SizedBox(
                  height: 16,
                ),
                TextButton(
                    onPressed: () {
                      maxLines.value = 100;
                    },
                    child: const Text('Развернуть'))
              ]);
            } else {
              return const SizedBox.shrink();
            }
          });
        }),
      ]);
    }

    Widget imageSlider(List<Images>? images) {
      return PageSlider(
          pages: images
              ?.map((e) => FadeInImage.assetNetwork(
                    fit: BoxFit.cover,
                    placeholder: 'asset/user.png',
                    image: e.image ?? '',
                  ))
              .toList(),
          key: sliderKey);
    }

    Widget directionButton(
        Icon icon, Alignment alignment, Function() function) {
      return Positioned.fill(
          left: 16,
          right: 16,
          child: Align(
            alignment: alignment,
            child: Card(
              elevation: 0,
              color: light,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: IconButton(color: blue, onPressed: function, icon: icon),
            ),
          ));
    }

    Widget indicator(int length) {
      return Positioned.fill(
          bottom: 13,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              elevation: 0,
              color: primaryAssentColor.withOpacity(0.7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: HookBuilder(
                builder: (ctx) {
                  final curPage = useValueListenable(currentPage);
                  return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 6),
                      child: Text('$curPage / $length',
                          style: const TextStyle(color: Colors.white)));
                },
              ),
            ),
          ));
    }

    Widget slideButtons(List<Images>? images) {
      final length = images?.length ?? 0;

      return HookBuilder(builder: (ctx) {
        final cur = useValueListenable(currentPage);
        return Stack(
          children: [
            imageSlider(images),
            if (cur > 1)
              directionButton(
                  const Icon(Icons.arrow_back), Alignment.centerLeft, () {
                sliderKey.currentState?.hasPrevious == true
                    ? {sliderKey.currentState?.previous(), currentPage.value--}
                    : null;
              }),
            if (cur < length)
              directionButton(
                  const Icon(Icons.arrow_forward), Alignment.centerRight, () {
                sliderKey.currentState?.hasNext == true
                    ? {sliderKey.currentState?.next(), currentPage.value++}
                    : null;
              }),
            if (length > 1) indicator(length)
          ],
        );
      });
    }

    void _launchUrl(String link) async {
      final uri = Uri.parse(link);
      if (!await launchUrl(uri)) throw 'Ошибка в ссылке';
    }

    Row socials(Contacts contacts) {
      return Row(
        children: [
          SizedBox(
            height: 36,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, i) {
                return Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                      border: Border.all(color: light, width: 1),
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  child: Center(
                      child: IconButton(
                    padding: const EdgeInsets.all(0),
                    iconSize: 17,
                    onPressed: () => _launchUrl(contacts.social![i].link!),
                    icon: Image.network(contacts.social![i].image!),
                  )),
                );
              },
              itemCount: contacts.social?.length,
            ),
          )
        ],
      );
    }

    Widget horizontalLists() {
      return BlocBuilder<HorizontalListsBloc, BaseState>(
        builder: (ctx, state) {
          switch (state.status) {
            case Status.loading:
              return const Center(child: CircularProgressIndicator());
            case Status.done:
              final list = state.responseValue as List<ItemModel>;
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('С этим товаром покупают',
                        style: Theme.of(context).textTheme.headline3),
                    HorrizontalListView(list),
                  ]);
            case Status.error:
              SchedulerBinding.instance.addPostFrameCallback((_) {
                showSnackBar(context, state.error.toString());
              });
              return const SizedBox.shrink();
          }
        },
      );
    }

    Widget mainWidget(ItemDetailModel model, Contacts contacts) {
      return SingleChildScrollView(
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (model.images != null && model.images?.isNotEmpty == true)
              slideButtons(model.images),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${model.name}',
                      style: Theme.of(context).textTheme.headline3),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text('Показания'),
                  const SizedBox(height: 6),
                  Text('${model.description}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(color: secondaryBlackColor)),
                  const SizedBox(height: 24),
                  if (model.byPrescription == true)
                    const Padding(
                        padding: EdgeInsets.only(bottom: 24),
                        child: Text('По рецепту врача',
                            style: TextStyle(color: orange))),
                  const Text('Поделиться'),
                  const SizedBox(height: 10),
                  socials(contacts),
                  const SizedBox(height: 30),
                  CustomTabBarWidget(
                      tabController: tabController,
                      firstTabTitle: 'Информация о товаре',
                      secondTabTitle: 'Инструкция'),
                  const SizedBox(height: 24),
                  HookBuilder(builder: (ctx) {
                    final tab = useValueListenable(tabIndex);
                    if (tab == 0) {
                      return itemInfo(model);
                    } else {
                      return Text('${model.instructions}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(color: secondaryBlackColor));
                    }
                  }),
                  const SizedBox(height: 30),
                  horizontalLists(),
                ],
              ),
            ),
            const SizedBox(height: kBottomNavigationBarHeight + 66)
          ],
        ),
      );
    }

    Widget showBottomSheet() {
      final countInCart = useValueNotifier(model.countInCart ?? 0);
      return Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
            padding:
                const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 26),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(0, -3), // changes position of shadow
                  ),
                ],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: HookBuilder(
              builder: (ctx) {
                final cInCartListener = useValueListenable(countInCart);
                return Column(
                  children: [
                    if (cInCartListener > 0)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (price != null)
                            Text('Цена: ',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    ?.copyWith(
                                        color: secondaryGray,
                                        fontWeight: FontWeight.w400)),
                          Text(
                            '$price c',
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    if (cInCartListener > 0) const SizedBox(height: 16),
                    ButtonsInRow(model, 2, isDetailPage: true)
                  ],
                );
              },
            )),
        const SizedBox(height: kBottomNavigationBarHeight - 10),
      ]);
    }

    return Scaffold(
      appBar: const CustomAppBar(),
      bottomSheet: showBottomSheet(),
      body: BlocBuilder<ItemDetailBloc, BaseState>(
        builder: (ctx, state) {
          switch (state.status) {
            case Status.loading:
              return const Center(child: CircularProgressIndicator());
            case Status.done:
              final map = state.responseValue as Map;
              final details = map['details'] as ItemDetailModel;
              final contacts = map['contacts'] as Contacts;
              ctx
                  .read<HorizontalListsBloc>()
                  .add(GetHorizontalListsEvents(details.similarProducts));

              return mainWidget(details, contacts);
            case Status.error:
              SchedulerBinding.instance.addPostFrameCallback((_) {
                showSnackBar(context, state.error.toString());
              });
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
