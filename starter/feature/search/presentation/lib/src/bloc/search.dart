import 'dart:math';

import 'package:core_bloc/bloc.dart';
import 'package:search_domain/domain.dart';

class SearchQueryCubit extends IFlowCubit<String> {
  SearchQueryCubit() : super(const DataState(data: ''));

  void search(String query) {
    emitData(query);
  }
}

class SearchRecentChannelListCubit extends IFlowCubit<List<Channel>> {
  final SetRecentSearchChannelsUseCase _setRecentSearchChannelsUseCase;
  final GetRecentSearchChannelsUseCase _getRecentSearchChannelsUseCase;

  SearchRecentChannelListCubit(
    this._setRecentSearchChannelsUseCase,
    this._getRecentSearchChannelsUseCase,
  );

  Future<void> load() async {
    emitLoading();

    try {
      final List<Channel> value = await _getRecentSearchChannelsUseCase.execute();
      emitData(value);
    } catch (e, s) {
      emitError(e, s);
    }
  }

  Future<void> add(Channel channel) async {
    try {
      final List<Channel> value = [...state.data ?? []];
      final int findIndex = value.indexWhere((e) => e.id == channel.id);
      if (findIndex != -1) {
        value.removeAt(findIndex);
      }
      value.insert(0, channel);
      final SetRecentSearchChannelsParams params = SetRecentSearchChannelsParams(
        channelList: value,
      );
      await _setRecentSearchChannelsUseCase.execute(params);
      emitData(value.sublist(0, min(3, value.length)));
    } catch (e, s) {
      emitError(e, s);
    }
  }

  Future<void> delete(Channel channel) async {
    try {
      final List<Channel> value = [...state.data ?? []];
      value.removeWhere((e) => e.id == channel.id);
      final SetRecentSearchChannelsParams params = SetRecentSearchChannelsParams(
        channelList: value,
      );
      await _setRecentSearchChannelsUseCase.execute(params);
      emitData(value);
    } catch (e, s) {
      emitError(e, s);
    }
  }
}

class SearchPopularChannelListCubit extends IFlowCubit<List<Channel>> {
  final GetPopularChannelsUseCase _getPopularChannels2UseCase;

  SearchPopularChannelListCubit(this._getPopularChannels2UseCase);

  Future<void> load() async {
    emitLoading();

    try {
      final List<Channel> value = await _getPopularChannels2UseCase.execute();
      emitData(value);
    } catch (e, s) {
      emitError(e, s);
    }
  }
}

class SearchPostListCubit extends IFlowCubit<List<Post>> {
  final GetSearchPostsUseCase _getSearchPostsUseCase;

  SearchPostListCubit(this._getSearchPostsUseCase);

  Future<void> load({
    required String query,
  }) async {
    emitLoading();

    try {
      final GetSearchPostsParams params = GetSearchPostsParams(
        query: query,
      );
      final List<Post> value = await _getSearchPostsUseCase.execute(params);
      emitData(value);
    } catch (e, s) {
      emitError(e, s);
    }
  }
}
