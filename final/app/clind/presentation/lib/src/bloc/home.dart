import 'package:core_bloc/bloc.dart';

class HomeTabCubit extends IFlowCubit<int> {
  HomeTabCubit() : super(const DataState(data: 0));

  void change({
    required int index,
  }) {
    if (state.data == index) return;
    emitData(index);
  }
}