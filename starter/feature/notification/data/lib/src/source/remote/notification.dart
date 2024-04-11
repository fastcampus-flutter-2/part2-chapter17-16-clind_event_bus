import 'package:tool_clind_network/network.dart';

abstract class INotificationRemoteDataSource {
  Future<dynamic> getNotifications();
}

class NotificationRemoteDataSource implements INotificationRemoteDataSource {
  final NotificationApi _api;

  NotificationRemoteDataSource(this._api);

  @override
  Future<dynamic> getNotifications() {
    return _api.getNotifications();
  }
}
