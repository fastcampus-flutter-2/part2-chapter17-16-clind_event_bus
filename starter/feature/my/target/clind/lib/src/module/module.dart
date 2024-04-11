import 'package:core_util/util.dart';
import 'package:feature_my/clind.dart';

class MyModule extends Module {
  @override
  void routes(RouteManager r) {
    for (final ModularRoute route in IMyRoutes.routes) {
      r.add(route);
    }
  }
}
