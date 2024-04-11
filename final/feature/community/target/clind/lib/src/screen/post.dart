import 'package:core_flutter_bloc/flutter_bloc.dart';
import 'package:core_util/util.dart';
import 'package:community_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:tool_clind_component/component.dart';
import 'package:tool_clind_theme/theme.dart';
import 'package:feature_community/clind.dart';

class PostScreen extends StatefulWidget {
  final String id;

  const PostScreen({
    super.key,
    required this.id,
  });

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refresh();
    });
    super.initState();
  }

  Future<void> _refresh() async {
    await Future.wait([
      context.readFlowBloc<PostCubit>().load(postId: widget.id),
      context.readFlowBloc<PostCommentListCubit>().load(postId: widget.id),
    ]);
  }

  Future<void> _loadMore() async {
    await context.readFlowBloc<PostCommentListCubit>().loadMore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.bg2,
      appBar: ClindAppBar(
        backgroundColor: context.colorScheme.bg2,
        context: context,
        leading: const ClindAppBarBackButton(),
        title: Text(
          'Clind',
          style: context.textTheme.poppins18Bold.copyWith(
            color: context.colorScheme.gray300,
          ),
        ),
        centerTitle: false,
      ),
      body: SizedBox.expand(
        child: ColoredBox(
          color: context.colorScheme.darkBlack,
          child: CoreRefreshIndicator(
            onRefresh: () => _refresh(),
            indicator: ClindIcon.restartAlt(
              color: context.colorScheme.gray600,
            ),
            child: CoreLoadMore(
              onLoadMore: () => _loadMore(),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: ColoredBox(
                      color: context.colorScheme.bg2,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: FlowBlocBuilder<PostCubit, Post>(builder: (context, state) {
                          final Post post = state.data ?? Post.empty();
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClindProfileTile(
                                imageUrl: post.imageUrl,
                                channel: post.channel,
                                company: post.company,
                                createdAt: post.createdAt,
                                onChannelTapped: () {},
                                onCompanyTapped: () {},
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                post.title,
                                style: context.textTheme.default20SemiBold.copyWith(
                                  color: context.colorScheme.gray100,
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                post.content,
                                style: context.textTheme.default15Medium.copyWith(
                                  color: context.colorScheme.gray200,
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: ClindCardButton.comment(
                      context,
                      onTap: () {},
                    ),
                  ),
                  FlowBlocBuilder<PostCommentListCubit, List<Comment>>(
                    builder: (context, state) {
                      final List<Comment> items = state.data ?? [];
                      if (items.isEmpty) return const SliverToBoxAdapter();
                      return PostCommentListView(
                        items: items,
                        onTap: (item) {},
                        isLoadMore: state is LoadMoreState,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: ClindChatBottomNavigationBar(
        hintText: '댓글을 남겨주세요.',
        onSend: (value) {},
      ),
    );
  }
}
