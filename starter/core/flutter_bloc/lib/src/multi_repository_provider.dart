import 'package:flutter_bloc/flutter_bloc.dart';

class FlowMultiRepositoryProvider extends MultiRepositoryProvider {
  FlowMultiRepositoryProvider({
    required super.providers,
    required super.child,
    super.key,
  });
}
