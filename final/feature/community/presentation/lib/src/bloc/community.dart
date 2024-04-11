import 'package:core_bloc/bloc.dart';
import 'package:community_domain/domain.dart';

class CommunityChannelListCubit extends IFlowCubit<List<Channel>> {
  final GetChannelsUseCase _getChannelsUseCase;

  CommunityChannelListCubit(this._getChannelsUseCase);

  Future<void> load({
    bool forceUpdate = false,
  }) async {
    if (state is IdleState || forceUpdate) {
      emitLoading();
    }

    try {
      final List<Channel> value = await _getChannelsUseCase.execute();
      emitData(value);
    } catch (e, s) {
      emitError(e, s);
    }
  }
}

class CommunityPopularChannelListCubit extends IFlowCubit<List<Channel>> {
  final GetPopularChannelsUseCase _getPopularChannelsUseCase;

  CommunityPopularChannelListCubit(this._getPopularChannelsUseCase);

  Future<void> load({
    bool forceUpdate = false,
  }) async {
    if (state is IdleState || forceUpdate) {
      emitLoading();
    }

    try {
      final List<Channel> value = await _getPopularChannelsUseCase.execute();
      emitData(value);
    } catch (e, s) {
      emitError(e, s);
    }
  }
}

class CommunityPostListCubit extends IFlowCubit<List<Post>> {
  final GetPostsUseCase _getPostsUseCase;

  CommunityPostListCubit(this._getPostsUseCase);

  final int _take = 10;

  int get _page {
    if (!state.hasData) return 0;
    return state.data!.length ~/ _take;
  }

  Future<void> load({
    bool forceUpdate = false,
  }) async {
    if (state is IdleState || forceUpdate) {
      emitLoading();
    }

    try {
      final GetPostsParams params = GetPostsParams(
        take: _take,
      );
      final List<Post> value = await _getPostsUseCase.execute(params);
      emitData(value);
    } catch (e, s) {
      emitError(e, s);
    }
  }

  Future<void> loadMore() async {
    emitLoadMore();

    try {
      final GetPostsParams params = GetPostsParams(
        take: _take,
        page: _page,
      );
      final List<Post> value = await _getPostsUseCase.execute(params);
      final List<Post> result = [...state.data!, ...value];
      emitData(result);
    } catch (e, s) {
      emitError(e, s);
    }
  }
}

class CommunityPopularPostListCubit extends IFlowCubit<List<Post>> {
  final GetPostsUseCase _getPostsUseCase;

  CommunityPopularPostListCubit(this._getPostsUseCase);

  final int _take = 10;

  int get _page {
    if (!state.hasData) return 0;
    return state.data!.length ~/ _take;
  }

  Future<void> load({
    bool forceUpdate = false,
  }) async {
    if (state is IdleState || forceUpdate) {
      emitLoading();
    }

    try {
      final GetPostsParams params = GetPostsParams(
        take: _take,
      );
      final List<Post> value = await _getPostsUseCase.execute(params);
      final List<Post> result = value..shuffle();
      emitData(result);
    } catch (e, s) {
      emitError(e, s);
    }
  }

  Future<void> loadMore() async {
    emitLoadMore();

    try {
      final GetPostsParams params = GetPostsParams(
        take: _take,
        page: _page,
      );
      final List<Post> value = await _getPostsUseCase.execute(params);
      final List<Post> result = [...state.data!, ...value..shuffle()];
      emitData(result);
    } catch (e, s) {
      emitError(e, s);
    }
  }
}
