import 'package:core_bloc/bloc.dart';
import 'package:community_domain/domain.dart';

class WritePostCubit extends IFlowCubit<Post> {
  final CreatePostUseCase _createPostUseCase;

  WritePostCubit(this._createPostUseCase);

  Future<void> load() async {
    final Post value = Post.empty();
    emitData(value);
  }

  void update({
    String? channel,
    String? title,
    String? content,
  }) {
    if (!state.hasData) return;

    final Post prevData = state.data!;
    final Post value = prevData.copyWith(
      channel: channel ?? prevData.channel,
      title: title ?? prevData.title,
      content: content ?? prevData.content,
    );

    emitData(value);
  }

  Future<void> publish() async {
    if (!state.hasData) return;

    emitLoading();

    try {
      final CreatePostParams params = CreatePostParams(
        channel: state.data!.channel,
        title: state.data!.title,
        content: state.data!.content,
      );
      final Post value = await _createPostUseCase.execute(params);
      emitData(value);
    } catch (e, s) {
      emitError(e, s);
    }
  }
}

class WriteMyCubit extends IFlowCubit<User> {
  final GetMyUseCase _getMyUseCase;

  WriteMyCubit(this._getMyUseCase);

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
