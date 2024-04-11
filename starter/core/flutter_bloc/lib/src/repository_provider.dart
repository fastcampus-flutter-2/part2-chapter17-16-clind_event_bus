import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlowRepositoryProvider<DataT> extends RepositoryProvider<DataT> {
  FlowRepositoryProvider({
    required DataT Function(BuildContext context) create,
    super.key,
    super.child,
    super.lazy,
  }) : super(create: create);

  FlowRepositoryProvider.value({
    required DataT value,
    super.key,
    super.child,
  }) : super.value(value: value);

  static DataT of<DataT>(
    BuildContext context, {
    bool listen = false,
  }) {
    return RepositoryProvider.of<DataT>(
      context,
      listen: listen,
    );
  }
}

extension FlowRepositoryProviderContext on BuildContext {
  DataT readFlowRepository<DataT>() {
    return read<DataT>();
  }

  DataT watchFlowRepository<DataT>() {
    return watch<DataT>();
  }
}
