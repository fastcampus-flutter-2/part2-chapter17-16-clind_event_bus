import 'package:core_flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

class HomeBlocProvider extends StatelessWidget {
  final Widget child;

  const HomeBlocProvider({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FlowMultiBlocProvider(
      providers: [
        FlowBlocProvider<HomeTabCubit>(
          create: (context) => HomeTabCubit(),
        ),
        FlowBlocProvider<HomeNestedTabCubit>(
          create: (context) => HomeNestedTabCubit(),
        ),
      ],
      child: child,
    );
  }
}
