import 'package:core_util/util.dart';
import 'package:ui/ui.dart';

class ClindModule extends Module {
  @override
  void routes(RouteManager r) {
    for (final ModularRoute route in IClindRoutes.routes) {
      r.add(route);
    }
  }
}
