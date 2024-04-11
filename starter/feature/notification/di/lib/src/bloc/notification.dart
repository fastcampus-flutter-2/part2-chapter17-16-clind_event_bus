import 'package:core_flutter_bloc/flutter_bloc.dart';
import 'package:notification_data/data.dart';
import 'package:notification_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:notification_presentation/presentation.dart';
import 'package:tool_clind_network/network.dart';

class NotificationBlocProvider extends StatelessWidget {
  final Widget child;

  const NotificationBlocProvider({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FlowRepositoryProvider<INotificationRemoteDataSource>(
      create: (context) => NotificationRemoteDataSource(NotificationApi(ClindRestClient())),
      child: FlowRepositoryProvider<NotificationDataSource>(
        create: (context) => NotificationDataSource(
          context.readFlowRepository<INotificationRemoteDataSource>(),
        ),
        child: FlowRepositoryProvider<INotificationRepository>(
          create: (context) => NotificationRepository(
            context.readFlowRepository<NotificationDataSource>(),
          ),
          child: FlowRepositoryProvider<GetNotificationsUseCase>(
            create: (context) => GetNotificationsUseCase(
              context.readFlowRepository<INotificationRepository>(),
            ),
            child: FlowBlocProvider<NotificationListCubit>(
              create: (context) => NotificationListCubit(
                context.readFlowRepository<GetNotificationsUseCase>(),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
