import 'package:core_flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension InteralFlowBlocBuilder on FlowBlocBuilder {
  static BlocWidgetBuilder<BlocT> when<DataT, BlocT extends IFlowState<DataT>>({
    BlocWidgetBuilder<IdleState<DataT>>? idle,
    BlocWidgetBuilder<LoadingState<DataT>>? loading,
    BlocWidgetBuilder<LoadMoreState<DataT>>? loadMore,
    BlocWidgetBuilder<EmptyState<DataT>>? empty,
    BlocWidgetBuilder<DataState<DataT>>? data,
    BlocWidgetBuilder<ErrorState<DataT>>? error,
    BlocWidgetBuilder<IFlowState<DataT>>? orElse,
  }) {
    return (context, state) {
      if (idle != null && state is IdleState<DataT>) {
        return idle(context, state);
      } else if (loading != null && state is LoadingState<DataT>) {
        return loading(context, state);
      } else if (loadMore != null && state is LoadMoreState<DataT>) {
        return loadMore(context, state);
      } else if (empty != null && state is EmptyState<DataT>) {
        return empty(context, state);
      } else if (data != null && state is DataState<DataT>) {
        return data(context, state);
      } else if (error != null && state is ErrorState<DataT>) {
        return error(context, state);
      } else if (orElse != null) {
        return orElse(context, state);
      }
      return const SizedBox.shrink();
    };
  }
}

extension InteralFlowBlocListener on FlowBlocListener {
  static BlocWidgetListener<BlocT> when<DataT, BlocT extends IFlowState<DataT>>({
    BlocWidgetListener<IdleState<DataT>>? onIdle,
    BlocWidgetListener<LoadingState<DataT>>? onLoading,
    BlocWidgetListener<LoadMoreState<DataT>>? onLoadMore,
    BlocWidgetListener<EmptyState<DataT>>? onEmpty,
    BlocWidgetListener<DataState<DataT>>? onData,
    BlocWidgetListener<ErrorState<DataT>>? onError,
    BlocWidgetListener<IFlowState<DataT>>? onElse,
  }) {
    return (context, state) {
      if (onIdle != null && state is IdleState<DataT>) {
        return onIdle(context, state);
      } else if (onLoading != null && state is LoadingState<DataT>) {
        return onLoading(context, state);
      } else if (onLoadMore != null && state is LoadMoreState<DataT>) {
        return onLoadMore(context, state);
      } else if (onEmpty != null && state is EmptyState<DataT>) {
        return onEmpty(context, state);
      } else if (onData != null && state is DataState<DataT>) {
        return onData(context, state);
      } else if (onError != null && state is ErrorState<DataT>) {
        return onError(context, state);
      } else if (onElse != null) {
        return onElse.call(context, state);
      }
    };
  }
}
