import 'package:bimed/src/core/block/base_state.dart';
import 'package:bimed/src/core/widgets/app_bar.dart';
import 'package:bimed/src/core/widgets/notification_item_widget.dart';
import 'package:bimed/src/ui/screens/secondary_widgets/notifications/bloc/notif_bloc.dart';
import 'package:bimed/src/ui/screens/secondary_widgets/notifications/bloc/notif_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/block/block_with_state.dart';
import '../../../../core/extenstions/custom_view.dart';
import '../../../../core/resources/colors.dart';

class NotificationsScreen extends HookWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    void request() {
      context.read<NotificationBloc>().add(const GetNotificationEvent());
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

    return Scaffold(
      appBar: const CustomAppBar(title: 'Уведомления'),
      body: BlocBuilder<NotificationBloc, BaseState>(
        builder: (ctx, state) {
          switch (state.status) {
            case Status.loading:
              return const Center(child: CircularProgressIndicator());
            case Status.done:
              final l = state.responseValue as List<String>;

              return l.isEmpty ? const Center(
                  child: Text(
                    'У вас пока нет уведомлений',
                    style: TextStyle(
                        color: secondaryGray,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w700),
                  )): ListView.builder(
                  // shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (ctx, index) {
                    return const NotificationItemWidget();
                  });
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

  void _onScrollListener(
      BuildContext context, ScrollController scrollController) {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    final remoteItemBloc = context.read<NotificationBloc>();
    final state = remoteItemBloc.blocProcessState;

    if (currentScroll == maxScroll && state == BlocProcessState.idle) {
      /*remoteItemBloc.add(GetResult({
        'search': '',
        'ordering': '',
        'product_type': productType,
        'category': category
      }));*/
    }
  }
}
