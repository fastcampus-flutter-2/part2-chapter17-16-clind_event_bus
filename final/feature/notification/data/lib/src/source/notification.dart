import 'package:notification_data/data.dart';

class NotificationDataSource {
  final INotificationRemoteDataSource _notificationRemoteDataSource;

  NotificationDataSource(this._notificationRemoteDataSource);

  Future<dynamic> getNotifications() {
    return _notificationRemoteDataSource.getNotifications();
  }
}
