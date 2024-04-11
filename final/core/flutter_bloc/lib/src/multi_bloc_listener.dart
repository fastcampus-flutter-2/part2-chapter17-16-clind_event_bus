import 'package:flutter_bloc/flutter_bloc.dart';

class FlowMultiBlocListener extends MultiBlocListener {
  FlowMultiBlocListener({
    required super.listeners,
    required super.child,
    super.key,
  });
}
