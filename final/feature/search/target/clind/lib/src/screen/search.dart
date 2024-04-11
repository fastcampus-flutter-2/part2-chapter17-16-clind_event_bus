import 'package:core_flutter_bloc/flutter_bloc.dart';
import 'package:core_util/util.dart';
import 'package:feature_search/clind.dart';
import 'package:flutter/material.dart';
import 'package:search_domain/domain.dart';
import 'package:search_presentation/presentation.dart';
import 'package:tool_clind_component/component.dart';
import 'package:tool_clind_theme/theme.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with SingleTickerProviderStateMixin {
  final List<String> _tabItems = ['전체', '토픽', '교육-출판 라운지', '서울컴퍼니', '기타라운지'];
  late final TabController _tabController = TabController(
    length: _tabItems.length,
    vsync: this,
  );

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refresh();
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _refresh() async {
    final String query = context.readFlowBloc<SearchQueryCubit>().state.data ?? '';
    await Future.wait([
      if (query.isNotEmpty) ...[
        context.readFlowBloc<SearchPostListCubit>().load(query: query),
      ] else ...[
        context.readFlowBloc<SearchRecentChannelListCubit>().load(),
        context.readFlowBloc<SearchPopularChannelListCubit>().load(),
      ],
    ]);
  }

  Future<void> _search(String query) {
    context.readFlowBloc<SearchQueryCubit>().search(query);
    return _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return FlowBlocBuilder<SearchQueryCubit, String>.when(
      data: (context, state) => Scaffold(
        backgroundColor: state.data.isNotEmpty ? context.colorScheme.darkBlack : context.colorScheme.bg2,
        appBar: ClindAppBar(
          context: context,
          backgroundColor: state.data.isNotEmpty ? context.colorScheme.darkBlack : context.colorScheme.bg2,
          leading: const ClindAppBarBackButton(),
          title: Padding(
            padding: const EdgeInsets.only(
              left: 9.0,
              right: 21.0,
            ),
            child: ClindSearchTextField(
              hintText: '키워드 또는 회사 검색',
              onSearch: (query) => _search(query),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(state.data.isNotEmpty ? 49.0 : 1.0),
            child: Column(
              children: [
                ClindDivider.horizontal(),
                if (state.data.isNotEmpty) ...[
                  SearchTabBar(
                    controller: _tabController,
                    tabs: _tabItems,
                    onTap: (index) {},
                  )
                ],
              ],
            ),
          ),
        ),
        body: state.data.isNotEmpty
            ? TabBarView(
                controller: _tabController,
                children: List.generate(
                  _tabItems.length,
                  (index) {
                    return CoreRefreshIndicator(
                      onRefresh: () => _refresh(),
                      indicator: ClindIcon.restartAlt(
                        color: context.colorScheme.gray600,
                      ),
                      child: CoreLoadMore(
                        onLoadMore: () async {},
                        child: CustomScrollView(
                          key: PageStorageKey<String>(index.toString()),
                          slivers: [
                            const SliverToBoxAdapter(
                              child: SizedBox(
                                height: 9.0,
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                ),
                                child: ClindSortFilter(
                                  text: '추천순',
                                  onTap: () {},
                                ),
                              ),
                            ),
                            const SliverToBoxAdapter(
                              child: SizedBox(
                                height: 9.0,
                              ),
                            ),
                            FlowBlocBuilder<SearchPostListCubit, List<Post>>(
                              builder: (context, state) {
                                final List<Post>? items = state.data;
                                if (items == null) return const SliverToBoxAdapter();
                                if (items.isEmpty) {
                                  return const SliverToBoxAdapter(
                                    child: SearchEmptyView(
                                      text: '검색 결과가 없습니다.',
                                    ),
                                  );
                                }
                                return SearchPostCardListView(
                                  items: items,
                                  onChannelTapped: (item) {},
                                  onCompanyTapped: (item) {},
                                  onLikeTapped: (item) {},
                                  onCommentTapped: (item) {},
                                  onViewTapped: (item) {},
                                  onTap: (item) => Modular.get<EventBus>().fire(
                                    RouteEvent('/community/post?id=${item.id}'),
                                  ),
                                  isLoadMore: false,
                                );
                              },
                            ),
                            const SliverToBoxAdapter(
                              child: SizedBox(
                                height: 56.0 + 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            : CustomScrollView(
                slivers: [
                  FlowBlocBuilder<SearchRecentChannelListCubit, List<Channel>>(
                    builder: (context, state) {
                      final List<Channel>? items = state.data;
                      if (items == null) return const SliverToBoxAdapter();
                      if (items.isEmpty) {
                        return const SliverToBoxAdapter(
                          child: SearchEmptyView(),
                        );
                      }
                      return SliverPadding(
                        padding: const EdgeInsets.only(
                          top: 15.0,
                          bottom: 20.0,
                          left: 20.0,
                          right: 16.0,
                        ),
                        sliver: SliverList.separated(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final Channel item = items[index];
                            final Widget child = SearchChannelTile.item(
                              item,
                              onTap: () => context.readFlowBloc<SearchRecentChannelListCubit>().add(item),
                              onDelete: () => context.readFlowBloc<SearchRecentChannelListCubit>().delete(item),
                            );
                            if (index == 0) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '최근 검색',
                                    style: context.textTheme.default14SemiBold.copyWith(
                                      color: context.colorScheme.gray400,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  child,
                                ],
                              );
                            }
                            return child;
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 22.0,
                          ),
                        ),
                      );
                    },
                  ),
                  FlowBlocBuilder<SearchPopularChannelListCubit, List<Channel>>.when(
                    data: (context, state) => SliverToBoxAdapter(
                      child: ColoredBox(
                        color: context.colorScheme.darkBlack,
                        child: const SizedBox(
                          height: 8.0,
                        ),
                      ),
                    ),
                    orElse: (context, state) => const SliverToBoxAdapter(),
                  ),
                  FlowBlocBuilder<SearchPopularChannelListCubit, List<Channel>>(
                    builder: (context, state) {
                      final List<Channel>? items = state.data;
                      if (items == null) return const SliverToBoxAdapter();
                      if (items.isEmpty) {
                        return SliverFillRemaining(
                          child: ColoredBox(
                            color: context.colorScheme.darkBlack,
                          ),
                        );
                      }
                      return SliverPadding(
                        padding: const EdgeInsets.only(
                          top: 24.0,
                          bottom: 20.0,
                          left: 20.0,
                          right: 20.0,
                        ),
                        sliver: SliverList.separated(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final Channel item = items[index];
                            final Widget child = SearchChannelTile.item(
                              item,
                              onTap: () => context.readFlowBloc<SearchRecentChannelListCubit>().add(item),
                            );
                            if (index == 0) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '인기 채널',
                                    style: context.textTheme.default14SemiBold.copyWith(
                                      color: context.colorScheme.gray400,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  child,
                                ],
                              );
                            }
                            return child;
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 22.0,
                          ),
                        ),
                      );
                    },
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.viewPaddingOf(context).bottom,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
