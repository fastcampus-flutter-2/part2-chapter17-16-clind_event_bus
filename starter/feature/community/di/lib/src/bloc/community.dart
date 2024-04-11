import 'package:core_flutter_bloc/flutter_bloc.dart';
import 'package:community_data/data.dart';
import 'package:community_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:community_presentation/presentation.dart';
import 'package:tool_clind_network/network.dart';

class CommunityBlocProvider extends StatelessWidget {
  final Widget child;

  const CommunityBlocProvider({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FlowRepositoryProvider<IPostRemoteDataSource>(
      create: (context) => PostRemoteDataSource(PostApi(ClindRestClient())),
      child: FlowRepositoryProvider<CommunityDataSource>(
        create: (context) => CommunityDataSource(
          context.readFlowRepository<IPostRemoteDataSource>(),
        ),
        child: FlowRepositoryProvider<ICommunityRepository>(
          create: (context) => CommunityRepository(
            context.readFlowRepository<CommunityDataSource>(),
          ),
          child: FlowMultiRepositoryProvider(
            providers: [
              FlowRepositoryProvider<GetChannelsUseCase>(
                create: (context) => GetChannelsUseCase(
                  context.readFlowRepository<ICommunityRepository>(),
                ),
              ),
              FlowRepositoryProvider<GetPopularChannelsUseCase>(
                create: (context) => GetPopularChannelsUseCase(
                  context.readFlowRepository<ICommunityRepository>(),
                ),
              ),
              FlowRepositoryProvider<GetPostsUseCase>(
                create: (context) => GetPostsUseCase(
                  context.readFlowRepository<ICommunityRepository>(),
                ),
              ),
            ],
            child: FlowMultiBlocProvider(
              providers: [
                FlowBlocProvider<CommunityChannelListCubit>(
                  create: (context) => CommunityChannelListCubit(
                    context.readFlowRepository<GetChannelsUseCase>(),
                  ),
                ),
                FlowBlocProvider<CommunityPopularChannelListCubit>(
                  create: (context) => CommunityPopularChannelListCubit(
                    context.readFlowRepository<GetPopularChannelsUseCase>(),
                  ),
                ),
                FlowBlocProvider<CommunityPostListCubit>(
                  create: (context) => CommunityPostListCubit(
                    context.readFlowRepository<GetPostsUseCase>(),
                  ),
                ),
                FlowBlocProvider<CommunityPopularPostListCubit>(
                  create: (context) => CommunityPopularPostListCubit(
                    context.readFlowRepository<GetPostsUseCase>(),
                  ),
                ),
              ],
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
