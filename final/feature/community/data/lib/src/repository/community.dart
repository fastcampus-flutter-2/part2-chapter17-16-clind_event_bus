import 'package:community_data/data.dart';
import 'package:community_domain/domain.dart';

class CommunityRepository implements ICommunityRepository {
  final CommunityDataSource _communityDataSource;

  CommunityRepository(this._communityDataSource);

  @override
  Future<List<Channel>> getChannels() async {
    final List<dynamic> jsonList = await _communityDataSource.getChannels();
    return jsonList.map((json) => Channel.fromJson(json)).toList();
  }

  @override
  Future<List<Channel>> getPopularChannels() async {
    final List<dynamic> jsonList = await _communityDataSource.getPopularChannels();
    return jsonList.map((json) => Channel.fromJson(json)).toList();
  }

  @override
  Future<List<Post>> getPosts({
    int take = 10,
    int page = 0,
  }) async {
    final List<dynamic> jsonList = await _communityDataSource.getPosts(
      take: take,
      page: page,
    );
    return jsonList.map((json) => Post.fromJson(json)).toList();
  }
}
