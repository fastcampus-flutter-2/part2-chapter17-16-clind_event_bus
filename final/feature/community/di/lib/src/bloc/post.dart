import 'package:core_flutter_bloc/flutter_bloc.dart';
import 'package:community_data/data.dart';
import 'package:community_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:community_presentation/presentation.dart';
import 'package:tool_clind_network/network.dart';

class PostBlocProvider extends StatelessWidget {
  final Widget child;

  const PostBlocProvider({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FlowRepositoryProvider<IPostRemoteDataSource>(
      create: (context) => PostRemoteDataSource(PostApi(ClindRestClient())),
      child: FlowRepositoryProvider<PostDataSource>(
        create: (context) => PostDataSource(
          context.readFlowRepository<IPostRemoteDataSource>(),
        ),
        child: FlowRepositoryProvider<IPostRepository>(
          create: (context) => PostRepository(
            context.readFlowRepository<PostDataSource>(),
          ),
          child: FlowMultiRepositoryProvider(
            providers: [
              FlowRepositoryProvider<GetPostUseCase>(
                create: (context) => GetPostUseCase(
                  context.readFlowRepository<IPostRepository>(),
                ),
              ),
              FlowRepositoryProvider<GetCommentsUseCase>(
                create: (context) => GetCommentsUseCase(
                  context.readFlowRepository<IPostRepository>(),
                ),
              ),
            ],
            child: FlowMultiBlocProvider(
              providers: [
                FlowBlocProvider<PostCubit>(
                  create: (context) => PostCubit(
                    context.readFlowRepository<GetPostUseCase>(),
                  ),
                ),
                FlowBlocProvider<PostCommentListCubit>(
                  create: (context) => PostCommentListCubit(
                    context.readFlowRepository<GetCommentsUseCase>(),
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
