import 'dart:ui';

import 'package:notification_domain/domain.dart';
import 'package:tool_clind_component/component.dart';
import 'package:tool_clind_theme/gen/gen.dart';

class NotificationTile extends ClindNotificationTile {
  NotificationTile({
    super.leading,
    required super.title,
    required super.content,
    required super.createdAt,
    required super.onTap,
  });

  factory NotificationTile.item(
    ClindNotification notification, {
    required VoidCallback onTap,
  }) {
    return NotificationTile(
      leading: switch (notification.type) {
        NotificationType.alarm => ClindIcon.flagCircle(
            color: ColorName.mainRed,
          ),
        NotificationType.notice => ClindIcon.circleNotifications(
            color: ColorName.mainRed,
          ),
        _ => ClindIcon.circleNotifications(
            color: ColorName.mainRed,
          ),
      },
      title: notification.title,
      content: notification.content,
      createdAt: notification.createdAt,
      onTap: onTap,
    );
  }
}
