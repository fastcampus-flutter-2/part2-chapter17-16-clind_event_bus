import 'package:core_bloc/bloc.dart';
import 'package:my_domain/domain.dart';

class MyCubit extends IFlowCubit<User> {
  final GetMyUseCase _getMyUseCase;

  MyCubit(this._getMyUseCase);

  Future<void> load() async {
    emitLoading();

    try {
      final User value = await _getMyUseCase.execute();
      emitData(value);
    } catch (e, s) {
      emitError(e, s);
    }
  }
}
