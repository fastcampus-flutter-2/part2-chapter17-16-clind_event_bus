import 'package:core_flutter_bloc/flutter_bloc.dart';
import 'package:core_util/util.dart';
import 'package:feature_notification/clind.dart';
import 'package:flutter/material.dart';
import 'package:notification_domain/domain.dart';
import 'package:notification_presentation/presentation.dart';
import 'package:tool_clind_component/component.dart';
import 'package:tool_clind_theme/theme.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refresh();
    });
    super.initState();
  }

  Future<void> _refresh() async {
    await context.readFlowBloc<NotificationListCubit>().load();
  }

  void _landing(String route) {
    Modular.get<EventBus>().fire(RouteEvent(route));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.darkBlack,
      appBar: ClindAppBar(
        context: context,
        title: ClindAppBarTitle.simple(
          context,
          text: '알림',
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.5,
            ),
            child: ClindAppBarIconAction(
              icon: ClindIcon.settings(
                color: context.colorScheme.gray300,
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: ClindDivider.horizontal(),
        ),
      ),
      body: CoreRefreshIndicator(
        onRefresh: () => _refresh(),
        indicator: ClindIcon.restartAlt(
          color: context.colorScheme.gray600,
        ),
        child: CoreLoadMore(
          onLoadMore: () async {},
          child: FlowBlocBuilder<NotificationListCubit, List<ClindNotification>>(
            builder: (context, state) {
              final List<ClindNotification> items = state.data ?? [];
              return ListView.separated(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final ClindNotification item = items[index];
                  return NotificationTile.item(
                    item,
                    onTap: () => _landing(item.route),
                  );
                },
                separatorBuilder: (context, index) => ClindDivider.horizontal(),
              );
            },
          ),
        ),
      ),
    );
  }
}
