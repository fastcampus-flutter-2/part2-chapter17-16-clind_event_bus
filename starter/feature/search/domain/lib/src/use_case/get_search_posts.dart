import 'package:core_util/util.dart';
import 'package:search_domain/domain.dart';

class GetSearchPostsUseCase implements IUseCase<List<Post>, GetSearchPostsParams> {
  final ISearchRepository _searchRepository;

  GetSearchPostsUseCase(this._searchRepository);

  @override
  Future<List<Post>> execute([GetSearchPostsParams? params]) {
    final GetSearchPostsParams input = params ?? GetSearchPostsParams();
    return _searchRepository.getSearchPosts(
      query: input.query,
      take: input.take,
      page: input.page,
    );
  }
}

class GetSearchPostsParams {
  final String query;
  final int take;
  final int page;

  GetSearchPostsParams({
    this.query = '',
    this.take = 10,
    this.page = 0,
  });
}
