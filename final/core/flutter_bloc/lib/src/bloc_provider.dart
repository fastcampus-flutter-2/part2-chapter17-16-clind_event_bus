import 'package:core_bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlowBlocProvider<BlocT extends BlocBase<IFlowState>> extends BlocProvider<BlocT> {
  const FlowBlocProvider({
    required BlocT Function(BuildContext context) create,
    super.key,
    super.child,
    super.lazy,
  }) : super(create: create);

  const FlowBlocProvider.value({
    required BlocT value,
    super.key,
    super.child,
  }) : super.value(value: value);

  static BlocT of<BlocT extends BlocBase<IFlowState>>(
    BuildContext context, {
    bool listen = false,
  }) {
    return BlocProvider.of<BlocT>(
      context,
      listen: listen,
    );
  }
}

extension FlowBlocProviderContext on BuildContext {
  BlocT readFlowBloc<BlocT extends BlocBase<IFlowState>>() {
    return read<BlocT>();
  }

  BlocT watchFlowBloc<BlocT extends BlocBase<IFlowState>>() {
    return watch<BlocT>();
  }
}
