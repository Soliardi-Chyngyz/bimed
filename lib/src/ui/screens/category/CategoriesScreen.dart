import 'package:bimed/src/configs/custom_router.dart';
import 'package:bimed/src/configs/route_paths.dart';
import 'package:bimed/src/core/block/base_state.dart';
import 'package:bimed/src/core/widgets/app_bar.dart';
import 'package:bimed/src/data/model/category_model/category_model.dart';
import 'package:bimed/src/ui/screens/category/bloc/category_bloc.dart';
import 'package:bimed/src/ui/screens/category/bloc/category_event.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../core/extenstions/custom_view.dart';
import '../../../core/resources/colors.dart';
import '../../../core/utils/preference/preference.dart';

class CategoriesScreen extends HookWidget {
  final String? title;
  final CategoryItem? categoryItem;

  const CategoriesScreen(this.categoryItem, this.title, {Key? key}) : super(key: key);
  static const id = '/CategoriesScreen';

  @override
  Widget build(BuildContext context) {
    void request() {
      if (categoryItem?.children == null) {
        context.read<CategoryBloc>().add(const GetCategories());
      }
    }

    void onNestedClick(List<CategoryItem> list, String title, int? id) {
      String t;
      if (this.title == null) {
        t = title;
      } else {
        t = '${this.title}, $title';
      }
      AppRouter.pushNested(
          context: context,
          route: AppRoutes.category,
          params: {
            'categoryItem': CategoryItem(id: id, children: list, name: title),
            'title': t
          });
    }

    void jumpToResultItems() async {
      String prodType = await Prefs().getProductType();

      AppRouter.pushNested(context: context, route: AppRoutes.result, params: {
        'product_type': prodType,
        'category': categoryItem?.id,
        'title': title,
      });
    }

    useEffect(() {
      request();
      return null;
    });

    return Scaffold(
      appBar: const SearchAppBar(),
      body: SingleChildScrollView(
        child: categoryItem?.children == null
            ? BlocBuilder<CategoryBloc, BaseState>(builder: (context, state) {
                switch (state.status) {
                  case Status.loading:
                    return const SizedBox.shrink();
                  case Status.done:
                    if (state.responseValue is List<CategoryItem>) {
                      final data = state.responseValue as List<CategoryItem>;

                      return buildCategoryWidget(context, data, onNestedClick, jumpToResultItems);
                    }
                    return const SizedBox.shrink();
                  case Status.error:
                    SchedulerBinding.instance.addPostFrameCallback((_) {
                      showSnackBar(context, state.error.toString());
                    });
                    return const SizedBox.shrink();
                }
              })
            : buildCategoryWidget(context, categoryItem!.children!, onNestedClick, jumpToResultItems),
      ),
    );
  }

  Column buildCategoryWidget(BuildContext context, List<CategoryItem> data,
      Function onNestedClick, Function jumpToResultItems) {
    return Column(
      children: [
        categoryItem?.name != null
            ? Column(
                children: [
                  ListTile(
                      onTap: () => Navigator.pop(context),
                      horizontalTitleGap: -13,
                      title: Text(categoryItem!.name),
                      leading:
                          const SizedBox(
                              height: double.infinity,
                              child: Icon(Icons.arrow_back_ios, size: 15, color: blue))),
                  const Divider(height: 1,),
                  ListTile(
                      visualDensity: const VisualDensity(vertical: -2.5),
                      title: Text(
                        categoryItem!.name,
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(fontSize: 16),
                      )),
                ],
              )
            : const SizedBox.shrink(),
        ListTile(
          onTap: () => jumpToResultItems(),
          title: Text('Посмотреть все',
              style: Theme.of(context).textTheme.bodyText2),
          visualDensity: const VisualDensity(vertical: -2.5),
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                visualDensity: const VisualDensity(vertical: -2.5),
                onTap: () =>
                    onNestedClick(data[index].children!, data[index].name, data[index].id),
                title: Text(data[index].name,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(color: secondaryBlackColor)),
                // ignore: prefer_const_constructors
                trailing: Icon(
                  size: 15,
                  Icons.arrow_forward_ios,
                  color: blue,
                ),
              );
            })
      ],
    );
  }
}
