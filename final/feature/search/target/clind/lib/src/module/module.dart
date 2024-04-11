import 'package:core_util/util.dart';
import 'package:feature_search/clind.dart';

class SearchModule extends Module {
  @override
  void routes(RouteManager r) {
    for (final ModularRoute route in ISearchRoutes.routes) {
      r.add(route);
    }
  }
}
