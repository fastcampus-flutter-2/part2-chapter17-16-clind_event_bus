import 'package:core_util/util.dart';
import 'package:feature_notification/clind.dart';

class NotificationModule extends Module {
  @override
  void routes(RouteManager r) {
    for (final ModularRoute route in INotificationRoutes.routes) {
      r.add(route);
    }
  }
}
