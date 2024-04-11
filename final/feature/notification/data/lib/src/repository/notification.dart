import 'package:notification_data/data.dart';
import 'package:notification_domain/domain.dart';

class NotificationRepository implements INotificationRepository {
  final NotificationDataSource _notificationDataSource;

  NotificationRepository(this._notificationDataSource);

  @override
  Future<List<ClindNotification>> getNotifications() async {
    final List<dynamic> jsonList = await _notificationDataSource.getNotifications();
    return jsonList.map((json) => ClindNotification.fromJson(json)).toList();
  }
}
