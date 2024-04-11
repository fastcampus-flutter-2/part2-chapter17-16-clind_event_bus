import 'package:flutter_bloc/flutter_bloc.dart';

class FlowMultiBlocProvider extends MultiBlocProvider {
  FlowMultiBlocProvider({
    required super.providers,
    required super.child,
    super.key,
  });
}
