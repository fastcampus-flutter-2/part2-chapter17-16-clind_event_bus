import 'package:core_bloc/bloc.dart';
import 'package:notification_domain/domain.dart';

class NotificationListCubit extends IFlowCubit<List<ClindNotification>> {
  final GetNotificationsUseCase _getNotificationsUseCase;

  NotificationListCubit(this._getNotificationsUseCase);

  Future<void> load() async {
    emitLoading();

    try {
      final List<ClindNotification> value = await _getNotificationsUseCase.execute();
      emitData(value);
    } catch (e, s) {
      emitError(e, s);
    }
  }
}
