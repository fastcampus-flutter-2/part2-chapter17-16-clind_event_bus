import 'dart:convert';

import 'package:search_data/data.dart';
import 'package:search_domain/domain.dart';

class SearchRepository implements ISearchRepository {
  final SearchDataSource _searchDataSource;

  SearchRepository(this._searchDataSource);

  @override
  Future<List<Channel>> getPopularChannels() async {
    final List<dynamic> jsonList = await _searchDataSource.getPopularChannels();
    return jsonList.map((json) => Channel.fromJson(json)).toList();
  }

  @override
  Future<List<Post>> getSearchPosts({
    String query = '',
    int? take,
    int? page,
  }) async {
    final List<dynamic> jsonList = await _searchDataSource.getSearchPosts(
      query: query,
      take: take,
      page: page,
    );
    return jsonList.map((json) => Post.fromJson(json)).toList();
  }

  @override
  Future<bool> setRecentSearchChannels({
    required List<Channel> channelList,
  }) async {
    if (channelList.isEmpty) return false;
    final String json = jsonEncode(channelList.map((e) => e.toJson()).toList());
    return _searchDataSource.setRecentSearchChannels(json);
  }

  @override
  Future<List<Channel>> getRecentSearchChannels() async {
    final String json = await _searchDataSource.getRecentSearchChannels();
    if (json.isEmpty) return [];
    final List<dynamic> jsonList = jsonDecode(json);
    return jsonList.map((json) => Channel.fromJson(json)).toList();
  }
}
