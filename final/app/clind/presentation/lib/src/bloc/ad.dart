import 'package:core_bloc/bloc.dart';
import 'package:core_util/util.dart';
import 'package:domain/domain.dart';

class AdCubit extends IFlowCubit<String> {
  final GetAdImageUseCase _getAdImageUseCase;

  AdCubit(this._getAdImageUseCase);

  Future<void> load() async {
    emitLoading();

    try {
      final String value = await _getAdImageUseCase.execute();
      if (value.isWebUrl) {
        emitData(value);
      } else {
        emitEmpty();
      }
    } catch (e, s) {
      emitError(e, s);
    }
  }
}
