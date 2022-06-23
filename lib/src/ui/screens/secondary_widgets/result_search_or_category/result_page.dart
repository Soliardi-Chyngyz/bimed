import 'package:bimed/src/core/block/base_state.dart';
import 'package:bimed/src/core/resources/colors.dart';
import 'package:bimed/src/core/widgets/app_bar.dart';
import 'package:bimed/src/core/widgets/custom_grid_view.dart';
import 'package:bimed/src/data/model/favorite/favorite_model.dart';
import 'package:bimed/src/ui/blocs/ItemEvent.dart';
import 'package:bimed/src/ui/blocs/item_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/extenstions/custom_view.dart';
import '../../../../core/widgets/popup_menu.dart';

class ResultScreen extends HookWidget {
  const ResultScreen(this.title, this.productType, this.category, {Key? key})
      : super(key: key);
  final String? title;
  final String? productType;
  final int? category;

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final gridType = useValueNotifier(2);

    void request() {
      context.read<ItemBloc>().setPageOne();
      context.read<ItemBloc>().add(GetResult({
            'search': '',
            'ordering': '',
            'product_type': productType,
            'category': category,
            'isFirst': true,
          }));
    }

    useEffect(
      () {
        request();
        scrollController
            .addListener(() => _onScrollListener(context, scrollController));
        return () {
          scrollController.removeListener(() {
            _onScrollListener(context, scrollController);
          });
        };
      },
      [scrollController],
    );

    Widget _buildListWidget() {
      return BlocBuilder<ItemBloc, BaseState>(builder: (context, state) {
        switch (state.status) {
          case Status.loading:
            return const Center(child: CircularProgressIndicator());
          case Status.done:
            if (state.responseValue is List<ItemModel>) {
              final data = state.responseValue as List<ItemModel>;

              return HookBuilder(builder: (ctx) {
                final isGrid = useValueListenable(gridType);
                return CustomGridView(
                  data,
                  top: 0,
                  crossAxisCount: isGrid,
                );
              });
            }
            return const SizedBox.shrink();
          case Status.error:
            SchedulerBinding.instance.addPostFrameCallback((_) {
              showSnackBar(context, state.error.toString());
            });
            return const SizedBox.shrink();
        }
      });
    }

    Widget _buildSort(BuildContext context) {
      return Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            )),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTapDown: (TapDownDetails details) =>
                      showPopupMenu(context, details.globalPosition, (value) {
                        context.read<ItemBloc>().add(FilterEvent(value));
                      }),
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: light,
                        ),
                        borderRadius:
                        const BorderRadius.all(Radius.circular(12))),
                    child: Row(
                      children: [
                        const Text(
                          'Сортировка',
                          style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                              color: purpleDark),
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        SvgPicture.asset('asset/icons/arrow_down.svg')
                      ],
                    ),
                  )),
              HookBuilder(
                builder: (ctx) {
                  final gridT = useValueListenable(gridType);

                  return Row(
                    children: [
                      const Text('Вид:'),
                      const SizedBox(
                        width: 8,
                      ),
                      IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () => gridType.value = 1,
                          icon: SvgPicture.asset(
                            'asset/icons/block_one.svg',
                            color: gridT == 1 ? blue : secondaryGray,
                          )),
                      const SizedBox(
                        width: 8,
                      ),
                      IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () => gridType.value = 2,
                          icon: SvgPicture.asset('asset/icons/bloc_grid.svg',
                              color: gridT == 2 ? blue : secondaryGray))
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      );
    }

    Widget _buildTitleAndSort(BuildContext context) {
      return Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? ' Все товары',
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(height: 12),
            _buildSort(context),
          ],
        ),
      );
    }

    return Scaffold(
        appBar: const SearchAppBar(),
        body: SingleChildScrollView(
            controller: scrollController,
            child: Column(children: [
              _buildTitleAndSort(context),
              _buildListWidget(),
            ])));
  }

  void _onScrollListener(
      BuildContext context, ScrollController scrollController) {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    final remoteItemBloc = context.read<ItemBloc>();
    final state = remoteItemBloc.blocProcessState;

    if (currentScroll == maxScroll && state == BlocProcessState.idle) {
      remoteItemBloc.add(GetResult({
        'search': '',
        'ordering': '',
        'product_type': productType,
        'category': category
      }));
    }
  }
}
