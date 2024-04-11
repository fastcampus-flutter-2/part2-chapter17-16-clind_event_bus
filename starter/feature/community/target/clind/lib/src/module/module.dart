import 'package:core_util/util.dart';
import 'package:feature_community/clind.dart';

class CommunityModule extends Module {
  @override
  void routes(RouteManager r) {
    for (final ModularRoute route in ICommunityRoutes.routes) {
      r.add(route);
    }
  }
}
