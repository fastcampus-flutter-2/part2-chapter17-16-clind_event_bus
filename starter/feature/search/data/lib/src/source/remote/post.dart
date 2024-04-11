import 'package:tool_clind_network/network.dart';

abstract class IPostRemoteDataSource {
  Future<dynamic> getPopularChannels();

  Future<dynamic> getSearchPosts({
    String query = '',
    int? take,
    int? page,
  });
}

class PostRemoteDataSource implements IPostRemoteDataSource {
  final PostApi _api;

  PostRemoteDataSource(this._api);

  @override
  Future<dynamic> getPopularChannels() {
    return _api.getPopularChannels();
  }

  @override
  Future<dynamic> getSearchPosts({
    String query = '',
    int? take,
    int? page,
  }) {
    return _api.getSearchPosts(
      query: query,
      take: take,
      page: page,
    );
  }
}
