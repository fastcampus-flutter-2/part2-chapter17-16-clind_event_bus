import 'package:search_domain/domain.dart';

abstract class ISearchRepository {
  Future<List<Channel>> getPopularChannels();

  Future<List<Post>> getSearchPosts({
    String query,
    int? take,
    int? page,
  });

  Future<bool> setRecentSearchChannels({
    required List<Channel> channelList,
  });

  Future<List<Channel>> getRecentSearchChannels();
}
